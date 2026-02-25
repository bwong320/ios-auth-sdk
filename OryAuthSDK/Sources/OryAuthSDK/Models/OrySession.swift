//
//  OrySession.swift
//  OryAuthSDK
//
//  Created by Benny Wong on 2/24/26.
//

import Foundation

public struct OrySession: Sendable {
    public let id: String
    public let token: String?
    public let identity: OryIdentity
    
    public init(id: String, token: String?, identity: OryIdentity) {
        self.id = id
        self.token = token
        self.identity = identity
    }
}

/* SAMPLE IDENTITY
 # This is a UUID generated when the identity is created. Can't be changed or updated.
 id: "9f425a8d-7efc-4768-8f23-7647a74fdf13"

 # Every identity has a state. Inactive identities can't log into the system.
 state: active

 # This section represents all credentials associated with the identity.
 credentials:
   password:
     id: password
     identifiers:
       - john.doe@acme.com
       - johnd@ory.com
     config:
       hashed_password: ...
   oidc:
     id: oidc
     identifiers:
       - google:j8kf7a3...
       - facebook:83475891...
     config:
       - provider: google
         identifier: j8kf7a3
       - provider: facebook
         identifier: 83475891

 # This is the JSON Schema ID used for validating the traits of this identity.
 schema_id: default

 # Traits represent information about the identity, such as the first or last name. The traits content is
 # up to you and will be validated using the JSON Schema at `traits_schema_url`.
 traits:
   # These are just examples
   email: office@ory.com
   name:
     first: Aeneas
     last: Rekkas
   favorite_animal: Dog
   accepted_tos: true

 # Public metadata is visible at the `/session/whoami` endpoint but cannot be modified by the users themselves.
 metadata_public:
   any:
     valid: ["json"]
     example: 1

 # Admin metadata only visible at administrative endpoints and cannot be modified by the users themselves.
 metadata_admin:
   another:
     valid: ["yaml"]
     example: 2
 */
public struct OryIdentity: Sendable {
    public let id: String
    
    public let traits: [String: String]
    
    public init(id: String, traits: [String : String]) {
        self.id = id
        self.traits = traits
    }
}
