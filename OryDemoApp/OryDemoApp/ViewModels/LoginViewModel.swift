//
//  LoginViewModel.swift
//  OryDemoApp
//
//  Created by Benny Wong on 2/24/26.
//

import Foundation
import OryAuthSDK
import OryClient
import SwiftUI
internal import Combine

@MainActor
class LoginViewModel: ObservableObject {
    
    @Published var fields: [OryField] = []
    @Published var fieldValues: [String: String] = [:]
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let oryClient: OryAuthClientProtocol
    private var flowId: String?
    private var onLogin: (OrySession) -> Void
    
    init(
        oryClient: OryAuthClientProtocol,
        onLogin: @escaping (OrySession) -> Void
    ) {
        self.oryClient = oryClient
        self.onLogin = onLogin
    }
    
    func initLoginFlow() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let loginFlow = try await oryClient.initLoginFlow()
            self.flowId = loginFlow.id
            self.fields = loginFlow.fields
            
            for field in loginFlow.fields {
                if let value = field.value {
                    fieldValues[field.id] = value
                }
            }
            
            print("flow loaded: \(loginFlow.id)")
            print("field count: \(loginFlow.fields.count)")
            for field in loginFlow.fields {
                print("  field: \(field.id), uiNodeType: \(field.uiNodeType.rawValue), uiNodeAttrType: \(field.uiNodeAttrModelType), label: \(field.label)")
            }
        } catch {
            // fix this to catch the proper type of error
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func submitLogin() async {
        guard let flowId = flowId else { return }
        isLoading = true
        errorMessage = nil
        
        do {
            let credentials = LoginCredentials(
                identifier: fieldValues["identifier"] ?? "",
                password: fieldValues["password"] ?? ""
            )
            let session = try await oryClient.submitLogin(
                flowId: flowId,
                credentials: credentials
            )
            // callback to trigger UI re-render
            onLogin(session)
        } catch {
            // need to update error handling
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
