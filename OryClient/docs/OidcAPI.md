# OidcAPI

All URIs are relative to *https://playground.projects.oryapis.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOidcDynamicClient**](OidcAPI.md#createoidcdynamicclient) | **POST** /oauth2/register | Register OAuth2 Client using OpenID Dynamic Client Registration
[**createVerifiableCredential**](OidcAPI.md#createverifiablecredential) | **POST** /credentials | Issues a Verifiable Credential
[**deleteOidcDynamicClient**](OidcAPI.md#deleteoidcdynamicclient) | **DELETE** /oauth2/register/{id} | Delete OAuth 2.0 Client using the OpenID Dynamic Client Registration Management Protocol
[**discoverOidcConfiguration**](OidcAPI.md#discoveroidcconfiguration) | **GET** /.well-known/openid-configuration | OpenID Connect Discovery
[**getOidcDynamicClient**](OidcAPI.md#getoidcdynamicclient) | **GET** /oauth2/register/{id} | Get OAuth2 Client using OpenID Dynamic Client Registration
[**getOidcUserInfo**](OidcAPI.md#getoidcuserinfo) | **GET** /userinfo | OpenID Connect Userinfo
[**revokeOidcSession**](OidcAPI.md#revokeoidcsession) | **GET** /oauth2/sessions/logout | OpenID Connect Front- and Back-channel Enabled Logout
[**setOidcDynamicClient**](OidcAPI.md#setoidcdynamicclient) | **PUT** /oauth2/register/{id} | Set OAuth2 Client using OpenID Dynamic Client Registration


# **createOidcDynamicClient**
```swift
    open class func createOidcDynamicClient(oAuth2Client: OAuth2Client, completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Register OAuth2 Client using OpenID Dynamic Client Registration

This endpoint behaves like the administrative counterpart (`createOAuth2Client`) but is capable of facing the public internet directly and can be used in self-service. It implements the OpenID Connect Dynamic Client Registration Protocol. This feature needs to be enabled in the configuration. This endpoint is disabled by default. It can be enabled by an administrator.  Please note that using this endpoint you are not able to choose the `client_secret` nor the `client_id` as those values will be server generated when specifying `token_endpoint_auth_method` as `client_secret_basic` or `client_secret_post`.  The `client_secret` will be returned in the response and you will not be able to retrieve it later on. Write the secret down and keep it somewhere safe.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let oAuth2Client = oAuth2Client(accessTokenStrategy: "accessTokenStrategy_example", allowedCorsOrigins: ["allowedCorsOrigins_example"], audience: ["audience_example"], authorizationCodeGrantAccessTokenLifespan: "authorizationCodeGrantAccessTokenLifespan_example", authorizationCodeGrantIdTokenLifespan: "authorizationCodeGrantIdTokenLifespan_example", authorizationCodeGrantRefreshTokenLifespan: "authorizationCodeGrantRefreshTokenLifespan_example", backchannelLogoutSessionRequired: false, backchannelLogoutUri: "backchannelLogoutUri_example", clientCredentialsGrantAccessTokenLifespan: "clientCredentialsGrantAccessTokenLifespan_example", clientId: "clientId_example", clientName: "clientName_example", clientSecret: "clientSecret_example", clientSecretExpiresAt: 123, clientUri: "clientUri_example", contacts: ["contacts_example"], createdAt: Date(), deviceAuthorizationGrantAccessTokenLifespan: "deviceAuthorizationGrantAccessTokenLifespan_example", deviceAuthorizationGrantIdTokenLifespan: "deviceAuthorizationGrantIdTokenLifespan_example", deviceAuthorizationGrantRefreshTokenLifespan: "deviceAuthorizationGrantRefreshTokenLifespan_example", frontchannelLogoutSessionRequired: false, frontchannelLogoutUri: "frontchannelLogoutUri_example", grantTypes: ["grantTypes_example"], implicitGrantAccessTokenLifespan: "implicitGrantAccessTokenLifespan_example", implicitGrantIdTokenLifespan: "implicitGrantIdTokenLifespan_example", jwks: jsonWebKeySet(keys: [jsonWebKey(alg: "alg_example", crv: "crv_example", d: "d_example", dp: "dp_example", dq: "dq_example", e: "e_example", k: "k_example", kid: "kid_example", kty: "kty_example", n: "n_example", p: "p_example", q: "q_example", qi: "qi_example", use: "use_example", x: "x_example", x5c: ["x5c_example"], y: "y_example")]), jwksUri: "jwksUri_example", jwtBearerGrantAccessTokenLifespan: "jwtBearerGrantAccessTokenLifespan_example", logoUri: "logoUri_example", metadata: 123, owner: "owner_example", policyUri: "policyUri_example", postLogoutRedirectUris: ["postLogoutRedirectUris_example"], redirectUris: ["redirectUris_example"], refreshTokenGrantAccessTokenLifespan: "refreshTokenGrantAccessTokenLifespan_example", refreshTokenGrantIdTokenLifespan: "refreshTokenGrantIdTokenLifespan_example", refreshTokenGrantRefreshTokenLifespan: "refreshTokenGrantRefreshTokenLifespan_example", registrationAccessToken: "registrationAccessToken_example", registrationClientUri: "registrationClientUri_example", requestObjectSigningAlg: "requestObjectSigningAlg_example", requestUris: ["requestUris_example"], responseTypes: ["responseTypes_example"], scope: "scope_example", sectorIdentifierUri: "sectorIdentifierUri_example", skipConsent: false, skipLogoutConsent: false, subjectType: "subjectType_example", tokenEndpointAuthMethod: "tokenEndpointAuthMethod_example", tokenEndpointAuthSigningAlg: "tokenEndpointAuthSigningAlg_example", tosUri: "tosUri_example", updatedAt: Date(), userinfoSignedResponseAlg: "userinfoSignedResponseAlg_example") // OAuth2Client | Dynamic Client Registration Request Body

// Register OAuth2 Client using OpenID Dynamic Client Registration
OidcAPI.createOidcDynamicClient(oAuth2Client: oAuth2Client) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oAuth2Client** | [**OAuth2Client**](OAuth2Client.md) | Dynamic Client Registration Request Body | 

### Return type

[**OAuth2Client**](OAuth2Client.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createVerifiableCredential**
```swift
    open class func createVerifiableCredential(createVerifiableCredentialRequestBody: CreateVerifiableCredentialRequestBody? = nil, completion: @escaping (_ data: VerifiableCredentialResponse?, _ error: Error?) -> Void)
```

Issues a Verifiable Credential

This endpoint creates a verifiable credential that attests that the user authenticated with the provided access token owns a certain public/private key pair.  More information can be found at https://openid.net/specs/openid-connect-userinfo-vc-1_0.html.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let createVerifiableCredentialRequestBody = CreateVerifiableCredentialRequestBody(format: "format_example", proof: VerifiableCredentialProof(jwt: "jwt_example", proofType: "proofType_example"), types: ["types_example"]) // CreateVerifiableCredentialRequestBody |  (optional)

// Issues a Verifiable Credential
OidcAPI.createVerifiableCredential(createVerifiableCredentialRequestBody: createVerifiableCredentialRequestBody) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createVerifiableCredentialRequestBody** | [**CreateVerifiableCredentialRequestBody**](CreateVerifiableCredentialRequestBody.md) |  | [optional] 

### Return type

[**VerifiableCredentialResponse**](VerifiableCredentialResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOidcDynamicClient**
```swift
    open class func deleteOidcDynamicClient(id: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete OAuth 2.0 Client using the OpenID Dynamic Client Registration Management Protocol

This endpoint behaves like the administrative counterpart (`deleteOAuth2Client`) but is capable of facing the public internet directly and can be used in self-service. It implements the OpenID Connect Dynamic Client Registration Protocol. This feature needs to be enabled in the configuration. This endpoint is disabled by default. It can be enabled by an administrator.  To use this endpoint, you will need to present the client's authentication credentials. If the OAuth2 Client uses the Token Endpoint Authentication Method `client_secret_post`, you need to present the client secret in the URL query. If it uses `client_secret_basic`, present the Client ID and the Client Secret in the Authorization header.  OAuth 2.0 clients are used to perform OAuth 2.0 and OpenID Connect flows. Usually, OAuth 2.0 clients are generated for applications which want to consume your OAuth 2.0 or OpenID Connect capabilities.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id of the OAuth 2.0 Client.

// Delete OAuth 2.0 Client using the OpenID Dynamic Client Registration Management Protocol
OidcAPI.deleteOidcDynamicClient(id: id) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String** | The id of the OAuth 2.0 Client. | 

### Return type

Void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **discoverOidcConfiguration**
```swift
    open class func discoverOidcConfiguration(completion: @escaping (_ data: OidcConfiguration?, _ error: Error?) -> Void)
```

OpenID Connect Discovery

A mechanism for an OpenID Connect Relying Party to discover the End-User's OpenID Provider and obtain information needed to interact with it, including its OAuth 2.0 endpoint locations.  Popular libraries for OpenID Connect clients include oidc-client-js (JavaScript), go-oidc (Golang), and others. For a full list of clients go here: https://openid.net/developers/certified/

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// OpenID Connect Discovery
OidcAPI.discoverOidcConfiguration() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**OidcConfiguration**](OidcConfiguration.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOidcDynamicClient**
```swift
    open class func getOidcDynamicClient(id: String, completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Get OAuth2 Client using OpenID Dynamic Client Registration

This endpoint behaves like the administrative counterpart (`getOAuth2Client`) but is capable of facing the public internet directly and can be used in self-service. It implements the OpenID Connect Dynamic Client Registration Protocol.  To use this endpoint, you will need to present the client's authentication credentials. If the OAuth2 Client uses the Token Endpoint Authentication Method `client_secret_post`, you need to present the client secret in the URL query. If it uses `client_secret_basic`, present the Client ID and the Client Secret in the Authorization header.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id of the OAuth 2.0 Client.

// Get OAuth2 Client using OpenID Dynamic Client Registration
OidcAPI.getOidcDynamicClient(id: id) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String** | The id of the OAuth 2.0 Client. | 

### Return type

[**OAuth2Client**](OAuth2Client.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOidcUserInfo**
```swift
    open class func getOidcUserInfo(completion: @escaping (_ data: OidcUserInfo?, _ error: Error?) -> Void)
```

OpenID Connect Userinfo

This endpoint returns the payload of the ID Token, including `session.id_token` values, of the provided OAuth 2.0 Access Token's consent request.  In the case of authentication error, a WWW-Authenticate header might be set in the response with more information about the error. See [the spec](https://datatracker.ietf.org/doc/html/rfc6750#section-3) for more details about header format.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// OpenID Connect Userinfo
OidcAPI.getOidcUserInfo() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**OidcUserInfo**](OidcUserInfo.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeOidcSession**
```swift
    open class func revokeOidcSession(completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

OpenID Connect Front- and Back-channel Enabled Logout

This endpoint initiates and completes user logout at the Ory OAuth2 & OpenID provider and initiates OpenID Connect Front- / Back-channel logout:  https://openid.net/specs/openid-connect-frontchannel-1_0.html https://openid.net/specs/openid-connect-backchannel-1_0.html  Back-channel logout is performed asynchronously and does not affect logout flow.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// OpenID Connect Front- and Back-channel Enabled Logout
OidcAPI.revokeOidcSession() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

Void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setOidcDynamicClient**
```swift
    open class func setOidcDynamicClient(id: String, oAuth2Client: OAuth2Client, completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Set OAuth2 Client using OpenID Dynamic Client Registration

This endpoint behaves like the administrative counterpart (`setOAuth2Client`) but is capable of facing the public internet directly to be used by third parties. It implements the OpenID Connect Dynamic Client Registration Protocol.  This feature is disabled per default. It can be enabled by a system administrator.  If you pass `client_secret` the secret is used, otherwise the existing secret is used. If set, the secret is echoed in the response. It is not possible to retrieve it later on.  To use this endpoint, you will need to present the client's authentication credentials. If the OAuth2 Client uses the Token Endpoint Authentication Method `client_secret_post`, you need to present the client secret in the URL query. If it uses `client_secret_basic`, present the Client ID and the Client Secret in the Authorization header.  OAuth 2.0 clients are used to perform OAuth 2.0 and OpenID Connect flows. Usually, OAuth 2.0 clients are generated for applications which want to consume your OAuth 2.0 or OpenID Connect capabilities.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | OAuth 2.0 Client ID
let oAuth2Client = oAuth2Client(accessTokenStrategy: "accessTokenStrategy_example", allowedCorsOrigins: ["allowedCorsOrigins_example"], audience: ["audience_example"], authorizationCodeGrantAccessTokenLifespan: "authorizationCodeGrantAccessTokenLifespan_example", authorizationCodeGrantIdTokenLifespan: "authorizationCodeGrantIdTokenLifespan_example", authorizationCodeGrantRefreshTokenLifespan: "authorizationCodeGrantRefreshTokenLifespan_example", backchannelLogoutSessionRequired: false, backchannelLogoutUri: "backchannelLogoutUri_example", clientCredentialsGrantAccessTokenLifespan: "clientCredentialsGrantAccessTokenLifespan_example", clientId: "clientId_example", clientName: "clientName_example", clientSecret: "clientSecret_example", clientSecretExpiresAt: 123, clientUri: "clientUri_example", contacts: ["contacts_example"], createdAt: Date(), deviceAuthorizationGrantAccessTokenLifespan: "deviceAuthorizationGrantAccessTokenLifespan_example", deviceAuthorizationGrantIdTokenLifespan: "deviceAuthorizationGrantIdTokenLifespan_example", deviceAuthorizationGrantRefreshTokenLifespan: "deviceAuthorizationGrantRefreshTokenLifespan_example", frontchannelLogoutSessionRequired: false, frontchannelLogoutUri: "frontchannelLogoutUri_example", grantTypes: ["grantTypes_example"], implicitGrantAccessTokenLifespan: "implicitGrantAccessTokenLifespan_example", implicitGrantIdTokenLifespan: "implicitGrantIdTokenLifespan_example", jwks: jsonWebKeySet(keys: [jsonWebKey(alg: "alg_example", crv: "crv_example", d: "d_example", dp: "dp_example", dq: "dq_example", e: "e_example", k: "k_example", kid: "kid_example", kty: "kty_example", n: "n_example", p: "p_example", q: "q_example", qi: "qi_example", use: "use_example", x: "x_example", x5c: ["x5c_example"], y: "y_example")]), jwksUri: "jwksUri_example", jwtBearerGrantAccessTokenLifespan: "jwtBearerGrantAccessTokenLifespan_example", logoUri: "logoUri_example", metadata: 123, owner: "owner_example", policyUri: "policyUri_example", postLogoutRedirectUris: ["postLogoutRedirectUris_example"], redirectUris: ["redirectUris_example"], refreshTokenGrantAccessTokenLifespan: "refreshTokenGrantAccessTokenLifespan_example", refreshTokenGrantIdTokenLifespan: "refreshTokenGrantIdTokenLifespan_example", refreshTokenGrantRefreshTokenLifespan: "refreshTokenGrantRefreshTokenLifespan_example", registrationAccessToken: "registrationAccessToken_example", registrationClientUri: "registrationClientUri_example", requestObjectSigningAlg: "requestObjectSigningAlg_example", requestUris: ["requestUris_example"], responseTypes: ["responseTypes_example"], scope: "scope_example", sectorIdentifierUri: "sectorIdentifierUri_example", skipConsent: false, skipLogoutConsent: false, subjectType: "subjectType_example", tokenEndpointAuthMethod: "tokenEndpointAuthMethod_example", tokenEndpointAuthSigningAlg: "tokenEndpointAuthSigningAlg_example", tosUri: "tosUri_example", updatedAt: Date(), userinfoSignedResponseAlg: "userinfoSignedResponseAlg_example") // OAuth2Client | OAuth 2.0 Client Request Body

// Set OAuth2 Client using OpenID Dynamic Client Registration
OidcAPI.setOidcDynamicClient(id: id, oAuth2Client: oAuth2Client) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String** | OAuth 2.0 Client ID | 
 **oAuth2Client** | [**OAuth2Client**](OAuth2Client.md) | OAuth 2.0 Client Request Body | 

### Return type

[**OAuth2Client**](OAuth2Client.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

