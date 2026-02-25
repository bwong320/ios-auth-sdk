//
//  LoginView.swift
//  OryDemoApp
//
//  Created by Benny Wong on 2/25/26.
//

import SwiftUI
import OryAuthSDK
import OryClient

struct LoginView: View {
    
    @StateObject private var viewModel: LoginViewModel
    
    init(oryClient: OryAuthClient, onLogin: @escaping (OrySession) -> Void) {
        _viewModel = StateObject(wrappedValue: LoginViewModel(
            oryClient: oryClient,
            onLogin: onLogin
        ))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Sign in")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if viewModel.isLoading && viewModel.fields.isEmpty {
                    ProgressView()
                } else {
                    renderFields
                    
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .padding()
        }
        .task {
            await viewModel.initLoginFlow()
        }
    }
    
    @ViewBuilder
    private var renderFields: some View {
        ForEach(viewModel.fields) { field in
            if field.uiNodeAttrModelType != .submit && field.uiNodeAttrModelType != .hidden {
                OryFieldView(
                    oryField: field,
                    value: binding(for: field.id)
                )
            } else if field.uiNodeAttrModelType == .submit {
                // Pass submitLogin to be used by button
                OryFieldView(
                    oryField: field,
                    value: binding(for: field.id)
                ) {
                    await viewModel.submitLogin()
                }
            }
        }
    }
    
    // need to create binding manually since the value from the field is stored in an array in viewModel
    private func binding(for fieldId: String) -> Binding<String> {
        Binding(
            get: { viewModel.fieldValues[fieldId] ?? "" },
            set: { viewModel.fieldValues[fieldId] = $0 }
        )
    }
}
