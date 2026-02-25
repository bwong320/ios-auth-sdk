//
//  OryFieldView.swift
//  OryDemoApp
//
//  Created by Benny Wong on 2/25/26.
//

import SwiftUI
import OryAuthSDK
import OryClient

struct OryFieldView: View {
    let oryField: OryField
    @Binding var value: String
    let onSubmit: () async -> Void
    
    init(
        oryField: OryField,
        value: Binding<String>,
        onSubmit: @escaping () async -> Void = {}
    ) {
        self.oryField = oryField
        self._value = value
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        switch oryField.uiNodeType {
        case .input:
            switch oryField.uiNodeAttrModelType {
            case .text:
                textField
            case .password:
                passwordField
            case .submit:
                submitButton
            case .hidden, .email, .button, .unknown:
                EmptyView()
            }
        case .text, .img, .a, .script, .div:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private var textField: some View {
        VStack(alignment: .leading, spacing: 4) {
            if !oryField.label.isEmpty {
                Text(oryField.label)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            TextField(
                oryField.label.isEmpty ? oryField.id : oryField.label,
                text: $value
            )
            .textFieldStyle(.roundedBorder)
            .autocorrectionDisabled()
            errorMessages
        }
    }
    
    @ViewBuilder
    private var passwordField: some View {
        VStack(alignment: .leading, spacing: 4) {
            if !oryField.label.isEmpty {
                Text(oryField.label)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            SecureField(
                oryField.label.isEmpty ? "Password" : oryField.label,
                text: $value
            )
            .textFieldStyle(.roundedBorder)
            errorMessages
        }
    }
    
    @ViewBuilder
    private var submitButton: some View {
        Button {
            Task { await onSubmit() }
        } label: {
            Text(oryField.label)
        }
        .buttonStyle(.borderedProminent)
    }
    
    @ViewBuilder
    private var errorMessages: some View {
        ForEach(oryField.messages) { message in
            if message.type == .error {
                Text(message.text)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}
