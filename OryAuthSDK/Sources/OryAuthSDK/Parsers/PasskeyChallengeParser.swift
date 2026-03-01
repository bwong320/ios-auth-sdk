//
//  PasskeyChallengeParser.swift
//  OryAuthSDK
//
//  Created by Benny Wong on 2/28/26.
//

import OryClient
import Foundation

struct PasskeyChallengeParser {
    
    func parse(from flow: OryLoginFlow) -> PasskeyChallenge? {
        // look for field with name "passkey_challenge"
        let passkeyChallengeField = flow.fields.first { $0.id == "passkey_challenge" }
        
        /* parse the json string
         "publicKey":{"challenge":"yCIYu-Ocy7usehgH40A0TkaVTx9zs2a8O44Yl6vKA68","timeout":300000,"rpId":"unruffled-chatterjee-lgs5rlnnc7.projects.oryapis.com","userVerification":"preferred"}}
         */
        guard passkeyChallengeField != nil,
              let passkeyChallenge = passkeyChallengeField!.value,
              let data = passkeyChallenge.data(using: .utf8),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let publicKey = json["publicKey"] as? [String: Any],
              let challenge = publicKey["challenge"] as? String,
              let challengeData = Data(base64URLEncoded: challenge),
              let rpId = publicKey["rpId"] as? String,
              let timeout = publicKey["timeout"] as? Int,
              let userVerification = publicKey["userVerification"] as? String else {
            return nil
        }
        
        return PasskeyChallenge(
            flowId: flow.id,
            challenge: challengeData,
            relyingPartyIdentifier: rpId,
            timeout: timeout,
            userVerification: userVerification
        )
    }
}
