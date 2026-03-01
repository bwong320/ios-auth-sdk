//
//  Data+Base64URL.swift
//  OryAuthSDK
//
//  Created by Benny Wong on 2/28/26.
//

import Foundation

extension Data {
    
    /// Decode base64url encoded string used by WebAuthn challenges
    init?(base64URLEncoded string: String) {
        var base64 = string
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        // Add padding if necessary
        let paddingLength = 4 - base64.count % 4
        if paddingLength < 4 {
            base64 += String(repeating: "=", count: paddingLength)
        }
        
        self.init(base64Encoded: base64)
    }
    
    /// Encode data as a base64url string for sending assertions back to server
    func base64URLEncodedString() -> String {
        base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .trimmingCharacters(in: CharacterSet(charactersIn: "="))
    }
}
