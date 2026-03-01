//
//  PasskeyChallenge.swift
//  OryAuthSDK
//
//  Created by Benny Wong on 2/28/26.
//

import Foundation

public struct PasskeyChallenge: Sendable {
    public let flowId: String
    public let challenge: Data
    public let relyingPartyIdentifier: String
    public let timeout: Int
    public let userVerification: String
    
    public init(flowId: String, challenge: Data, relyingPartyIdentifier: String,
                timeout: Int, userVerification: String) {
        self.flowId = flowId
        self.challenge = challenge
        self.relyingPartyIdentifier = relyingPartyIdentifier
        self.timeout = timeout
        self.userVerification = userVerification
    }
}
