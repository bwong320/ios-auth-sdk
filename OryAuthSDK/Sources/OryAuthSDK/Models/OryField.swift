//
//  OryField.swift
//  OryAuthSDK
//
//  Created by Benny Wong on 2/24/26.
//

import OryClient

///
public enum FieldType: Sendable {
    case text
    case password
    case email
    case hidden
    case submit
    case button
    case unknown
}

public enum MessageType: Sendable {
    case error
    case info
    case success
}

/// Parsed field from Ui Node passed from flow
public struct OryField: Identifiable, Sendable {
    public let id: String
    public let label: String
    public let uiNodeType: UiNode.ModelType
    public let uiNodeAttrModelType: FieldType
    public let isRequired: Bool
    public let value: String?
    public let messages: [FieldMessage]
    public let group: UiNode.Group
}

public struct FieldMessage: Identifiable, Sendable {
    public let id: String
    public let text: String
    public let type: UiText.ModelType
}
