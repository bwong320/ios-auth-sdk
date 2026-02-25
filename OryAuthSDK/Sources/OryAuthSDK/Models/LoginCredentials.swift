//
//  LoginCredentials.swift
//  OryAuthSDK
//
//  Created by Benny Wong on 2/24/26.
//

public struct LoginCredentials {
    public let identifier: String
    public let password: String
    
    public init(identifier: String, password: String) {
        self.identifier = identifier
        self.password = password
    }
}
