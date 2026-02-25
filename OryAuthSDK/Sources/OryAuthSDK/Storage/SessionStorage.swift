//
//  SessionStorage.swift
//  
//
//  Created by Benny Wong on 2/24/26.
//

import Foundation

final class SessionStorage {
    
    private let service: String
    
    init(service: String = "com.oryauthsdk.tokens") {
        self.service = service
    }
    
    func save(key: String, value: String) throws {
        guard let data = value.data(using: .utf8) else { return }
        
        delete(key: key)
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw OryError.unknown(
                NSError(domain: "SessionStorage", code: Int(status))
            )
        }
    }
    
    func retrieve(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true,
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess else { return nil }
        
        if let data = result as? Data {
            let string = String(data: data, encoding: .utf8)
            return string
        } else {
            return nil
        }
    }
    
    func delete(key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]
        SecItemDelete(query as CFDictionary)
    }
}
