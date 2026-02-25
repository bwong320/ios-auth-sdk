//
//  OryLoginFlow.swift
//  OryAuthSDK
//
//  Created by Benny Wong on 2/24/26.
//

public struct OryLoginFlow: Sendable {
    public let id: String
    public let fields: [OryField]
    public let action: String
    public let method: String
    
    public init(id: String, fields: [OryField], action: String, method: String) {
        self.id = id
        self.fields = fields
        self.action = action
        self.method = method
    }
}
