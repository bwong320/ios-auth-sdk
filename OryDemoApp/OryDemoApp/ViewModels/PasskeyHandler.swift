//
//  PasskeyHandler.swift
//  OryDemoApp
//
//  Created by Benny Wong on 3/2/26.
//

import Foundation
import SwiftUI
import AuthenticationServices
import OryAuthSDK
internal import Combine

@MainActor
class PasskeyHandler: NSObject, ObservableObject,
    ASAuthorizationControllerDelegate,
    ASAuthorizationControllerPresentationContextProviding {
    
    @Published var isAuthenticating = false
    @Published var errorMessage: String?
    
    private let oryClient: OryAuthClientProtocol
    private var flowId: String?
    private var onLogin: (OrySession) -> Void
    
    init(oryClient: OryAuthClientProtocol, onLogin: @escaping (OrySession) -> Void) {
        self.oryClient = oryClient
        self.onLogin = onLogin
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }
    
    /*
     let challenge: Data // Obtain this from the server.
     let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(relyingPartyIdentifier: "example.com")
     let platformKeyRequest = platformProvider.createCredentialAssertionRequest(challenge: challenge)
     let authController = ASAuthorizationController(authorizationRequests: [platformKeyRequest])
     authController.delegate = self
     authController.presentationContextProvider = self
     authController.performRequests()
     */
    func startAssertion(with challenge: PasskeyChallenge?) async throws {
        guard let challenge = challenge else {
            errorMessage = "No valid passkey challenge"
            return
        }
        isAuthenticating = true
        errorMessage = nil
        flowId = challenge.flowId
        
        let platformProvider = ASAuthorizationPlatformPublicKeyCredentialProvider(
            relyingPartyIdentifier: challenge.relyingPartyIdentifier
        )
        let platformKeyRequest = platformProvider.createCredentialAssertionRequest(
            challenge: challenge.challenge
        )
        
        let authController = ASAuthorizationController(authorizationRequests: [platformKeyRequest])
        authController.delegate = self
        authController.presentationContextProvider = self
        authController.performRequests()
    }
    
    /*
     if let credential = authorization.credential as? ASAuthorizationPlatformPublicKeyCredentialRegistration {
       // Take steps to handle the registration.
    } else if let credential = authorization.credential as? ASAuthorizationPlatformPublicKeyCredentialAssertion {
       // Take steps to verify the challenge.
     } else {
       // Handle other authentication cases, such as Sign in with Apple.
     */
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let assertionCredential as ASAuthorizationPublicKeyCredentialAssertion:
            guard let flowId = flowId else {
                isAuthenticating = false
                errorMessage = "No active login flow"
                return
            }
            
            Task {
                do {
                    let session = try await oryClient.submitPasskeyAssertion(
                        flowId: flowId,
                        credentialId: assertionCredential.credentialID,
                        clientDataJSON: assertionCredential.rawClientDataJSON,
                        authenticatorData: assertionCredential.rawAuthenticatorData,
                        signature: assertionCredential.signature
                    )
                    
                    onLogin(session)
                } catch {
                    errorMessage = error.localizedDescription
                }
                isAuthenticating = false
                self.flowId = nil
            }
        default:
            isAuthenticating = false
            errorMessage = "Unexpected credential type"
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithError error: Error) {
        isAuthenticating = false
        flowId = nil
        
        if let authError = error as? ASAuthorizationError,
           authError.code == .canceled {
            return
        }
        
        errorMessage = error.localizedDescription
    }
}
