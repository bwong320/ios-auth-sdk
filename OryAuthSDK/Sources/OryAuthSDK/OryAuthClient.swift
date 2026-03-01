//
//  OryAuthClient.swift
//
//
//  Created by Benny Wong on 2/24/26.
//

import OryClient
import Foundation

public protocol OryAuthClientProtocol {
    func initLoginFlow() async throws -> OryLoginFlow
    func submitLogin(flowId: String, credentials: LoginCredentials) async throws -> OrySession
    func getPasskeyChallenge(from flow: OryLoginFlow) async throws -> PasskeyChallenge
    func submitPasskeyAssertion(flowId: String, credentialId: Data, clientDataJSON: Data, authenticatorData: Data, signature: Data) async throws -> OrySession
    /*func initRegistrationFlow() async throws -> OryRegistrationFlow
    func submitRegistration(flowId: String, credentials: RegistrationCredentials) async throws -> OrySession*/
    func getSession() async throws -> OrySession
    func logout() async throws
}

public final class OryAuthClient: OryAuthClientProtocol {
    
    private let apiConfig: OpenAPIClientAPIConfiguration
    private let nodeParser: UiNodeParser
    private let passkeyChallengeParser: PasskeyChallengeParser
    private let sessionStore: SessionStorage
    
    // Session token key is constant due to supporting one session
    private let sessionTokenKey = "ory_session_token"
    
    public init(projectBaseURL: String) {
        self.apiConfig = OpenAPIClientAPIConfiguration(basePath: projectBaseURL)
        self.nodeParser = UiNodeParser()
        self.passkeyChallengeParser = PasskeyChallengeParser()
        self.sessionStore = SessionStorage()
    }
    
    // MARK: - Login
    
    public func initLoginFlow() async throws -> OryLoginFlow {
        do {
            let flow = try await FrontendAPI.createNativeLoginFlow(apiConfiguration: apiConfig)
            let fields = nodeParser.parseNodes(flow.ui.nodes)
            
            return OryLoginFlow(
                id: flow.id,
                fields: fields,
                action: flow.ui.action,
                method: flow.ui.method
            )
        } catch {
            throw parseOryError(error)
        }
    }
    
    public func submitLogin(flowId: String, credentials: LoginCredentials) async throws -> OrySession {
        do {
            let body = UpdateLoginFlowBody.typeUpdateLoginFlowWithPasswordMethod(
                UpdateLoginFlowWithPasswordMethod(
                    identifier: credentials.identifier,
                    method: "password",
                    password: credentials.password
                )
            )
            
            // updateLoginFlow returns SuccessfulNativeLogin
            let response = try await FrontendAPI.updateLoginFlow(
                flow: flowId,
                updateLoginFlowBody: body,
                apiConfiguration: apiConfig
            )
            
            // store session token in keychain via sessionStore
            if let token = response.sessionToken {
                try sessionStore.save(key: sessionTokenKey, value: token)
            }
            
            let identity = parseIdentity(response.session.identity)
            
            return OrySession(
                id: response.session.id,
                token: response.sessionToken,
                identity: identity
            )
        } catch let error as ErrorResponse {
            throw parseOryError(error)
        }
    }
    
    // MARK: - Passkey
    
    public func getPasskeyChallenge(from flow: OryLoginFlow) async throws -> PasskeyChallenge {
        do {
            guard let passkeyChallenge = passkeyChallengeParser.parse(from: flow) else {
                throw OryError.unknown(
                    NSError(domain: "OryAuthSDK", code: -1, userInfo: [NSLocalizedDescriptionKey: "No passkey challenge in flow."])
                )
            }
            
            return passkeyChallenge
        } catch {
            throw OryError.unknown(error)
        }
    }
    
    public func submitPasskeyAssertion(flowId: String, credentialId: Data, clientDataJSON: Data, authenticatorData: Data, signature: Data) async throws -> OrySession {
        do {
            let assertionResponse: [String: Any] = [
                "id": credentialId.base64URLEncodedString(),
                "rawId": credentialId.base64URLEncodedString(),
                "type": "public-key",
                "response": [
                    "clientDataJSON": clientDataJSON.base64URLEncodedString(),
                    "authenticatorData": authenticatorData.base64URLEncodedString(),
                    "signature": signature.base64URLEncodedString()
                ]
            ]
            
            let assertionJSON = try JSONSerialization.data(withJSONObject: assertionResponse)
            guard let assertionString = String(data: assertionJSON, encoding: .utf8) else {
                throw OryError.unknown(
                    NSError(domain: "OryAuthSDK", code: -1,
                            userInfo: [NSLocalizedDescriptionKey: "Failed to encode passkey assertion"])
                )
            }
            
            let body = UpdateLoginFlowBody.typeUpdateLoginFlowWithPasskeyMethod(
                UpdateLoginFlowWithPasskeyMethod(
                    method: "passkey",
                    passkeyLogin: assertionString
                )
            )
            
            let response = try await FrontendAPI.updateLoginFlow(
                flow: flowId,
                updateLoginFlowBody: body,
                apiConfiguration: apiConfig
            )
            
            if let token = response.sessionToken {
                try sessionStore.save(key: sessionTokenKey, value: token)
            }
            
            let identity = parseIdentity(response.session.identity)
            
            return OrySession(
                id: response.session.id,
                token: response.sessionToken,
                identity: identity
            )
        }
    }
    
    // MARK: - Session
    
    public func getSession() async throws -> OrySession {
        guard let token = sessionStore.retrieve(key: sessionTokenKey) else {
            throw OryError.unauthorized
        }
        
        do {
            let session = try await FrontendAPI.toSession(
                xSessionToken: token,
                apiConfiguration: apiConfig
            )
            let identity = parseIdentity(session.identity)
            
            return OrySession(
                id: session.id,
                token: token,
                identity: identity
            )
        } catch {
            throw parseOryError(error)
        }
    }
    
    /// Logout deletes the saved session from the Keychain
    public func logout() async throws {
        sessionStore.delete(key: sessionTokenKey)
    }
    
    // MARK: - Helper methods
    
    private func parseIdentity(_ identity: Identity?) -> OryIdentity {
        guard let identity = identity else {
            return OryIdentity(id: "", traits: [:])
        }
        
        // Extract string values from traits dictionary
        var traits: [String: String] = [:]
        if let traitsDict = identity.traits?.dictionaryValue {
            for (key, value) in traitsDict {
                switch value {
                case .string(let str):
                    traits[key] = str
                case .int(let num):
                    traits[key] = String(num)
                case .double(let num):
                    traits[key] = String(num)
                case .bool(let flag):
                    traits[key] = String(flag)
                default:
                    break
                }
            }
        }
        
        return OryIdentity(id: identity.id, traits: traits)
    }
    
    private func parseOryError(_ error: ErrorResponse) -> OryError {
        switch error {
        case .error(let statusCode, let data, let urlResponse, let underlyingError):
            print("statusCode: \(statusCode)")
            print("data: \(String(describing: data))")
            print("urlResponse: \(String(describing: urlResponse))")
            print("underlyingError: \(underlyingError.localizedDescription)")
            switch statusCode {
            // what other cases to handle?
            case 410:
                return .expiredFlow
            default:
                return .unknown(underlyingError)
            }
        }
    }
    
    private func isPasskeyEnabled(in fields: [OryField]) -> Bool {
        for field in fields {
            if field.group == .passkey {
                return true
            }
        }
        return false
    }
}
