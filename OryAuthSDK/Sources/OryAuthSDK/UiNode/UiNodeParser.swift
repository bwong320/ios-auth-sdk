//
//  UiNodeParser.swift
//
//
//  Created by Benny Wong on 2/24/26.
//

import OryClient

struct UiNodeParser {
    
    /// Flows contain UiContainer which contains the UiNodes
    /// parseNodes should return an array of OryField to be used to generate UI in demo app
    func parseNodes(_ nodes: [UiNode]) -> [OryField] {
        nodes.compactMap{ parseNode($0) }
    }
    
    private func parseNode(_ node: UiNode) -> OryField? {
        switch node.attributes {
        case .typeUiNodeInputAttributes(let inputAttr):
            return parseInputNode(inputAttr, node: node)
        case .typeUiNodeTextAttributes(let textAttr):
            return parseTextNode(textAttr, node: node)
        // do not need to support for now
        case .typeUiNodeAnchorAttributes,
            .typeUiNodeDivisionAttributes,
            .typeUiNodeImageAttributes,
            .typeUiNodeScriptAttributes:
            return nil
        }
    }
    
    /* sample UI input node (most common node type)
     {
       "type": "input",
       "group": "default",
       "attributes": {
         "name": "csrf_token",
         "type": "hidden",
         "node_type": "input",
         "value": "U3r/lgEfT8rA1Lg0Eeo06oGO8mX6T4TKoe/z7rbInhvYeacbRg0IW9zrqnpU1wmQJXKiekNzdLnypx5naHXoPg==",
         "required": true,
         "disabled": false
       },
       "messages": null,
       "meta": {}
     }
     */
    private func parseInputNode(_ inputAttributes: UiNodeInputAttributes, node: UiNode) -> OryField {
        return OryField(
            id: inputAttributes.name,
            label: node.meta.label?.text ?? "",
            uiNodeType: node.type,
            uiNodeAttrModelType: parseFieldType(inputAttributes.type.rawValue),
            isRequired: inputAttributes._required ?? false,
            value: inputAttributes.value?.stringValue ?? "",
            messages: parseMessages(node.messages),
            group: node.group
        )
    }
    
    private func parseTextNode(_ textAttributes: UiNodeTextAttributes, node: UiNode) -> OryField {
        return OryField(
            id: textAttributes.id,
            label: node.meta.label?.text ?? "",
            uiNodeType: .text,
            uiNodeAttrModelType: .text,
            isRequired: false,
            value: textAttributes.text.text,
            messages: parseMessages(node.messages),
            group: node.group
        )
    }
    
    // MARK: - Helper methods
    
    private func parseMessages(_ messages: [UiText]?) -> [FieldMessage] {
        guard let messages = messages else { return [] }
        return messages.map { message in
            FieldMessage(
                id: String(message.id),
                text: message.text,
                type: message.type
            )
        }
    }
    
    private func parseFieldType(_ type: String) -> FieldType {
        switch type {
            case "text": return .text
            case "password": return .password
            case "hidden": return .hidden
            case "email": return .email
            case "submit": return .submit
            case "button": return .button
            default: return .unknown
        }
    }
}
