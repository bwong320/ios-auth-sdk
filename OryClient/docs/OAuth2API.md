# OAuth2API

All URIs are relative to *https://playground.projects.oryapis.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**acceptOAuth2ConsentRequest**](OAuth2API.md#acceptoauth2consentrequest) | **PUT** /admin/oauth2/auth/requests/consent/accept | Accept OAuth 2.0 Consent Request
[**acceptOAuth2LoginRequest**](OAuth2API.md#acceptoauth2loginrequest) | **PUT** /admin/oauth2/auth/requests/login/accept | Accept OAuth 2.0 Login Request
[**acceptOAuth2LogoutRequest**](OAuth2API.md#acceptoauth2logoutrequest) | **PUT** /admin/oauth2/auth/requests/logout/accept | Accept OAuth 2.0 Session Logout Request
[**acceptUserCodeRequest**](OAuth2API.md#acceptusercoderequest) | **PUT** /admin/oauth2/auth/requests/device/accept | Accepts a device grant user_code request
[**createOAuth2Client**](OAuth2API.md#createoauth2client) | **POST** /admin/clients | Create OAuth 2.0 Client
[**deleteOAuth2Client**](OAuth2API.md#deleteoauth2client) | **DELETE** /admin/clients/{id} | Delete OAuth 2.0 Client
[**deleteOAuth2Token**](OAuth2API.md#deleteoauth2token) | **DELETE** /admin/oauth2/tokens | Delete OAuth 2.0 Access Tokens from specific OAuth 2.0 Client
[**deleteTrustedOAuth2JwtGrantIssuer**](OAuth2API.md#deletetrustedoauth2jwtgrantissuer) | **DELETE** /admin/trust/grants/jwt-bearer/issuers/{id} | Delete Trusted OAuth2 JWT Bearer Grant Type Issuer
[**getOAuth2Client**](OAuth2API.md#getoauth2client) | **GET** /admin/clients/{id} | Get an OAuth 2.0 Client
[**getOAuth2ConsentRequest**](OAuth2API.md#getoauth2consentrequest) | **GET** /admin/oauth2/auth/requests/consent | Get OAuth 2.0 Consent Request
[**getOAuth2LoginRequest**](OAuth2API.md#getoauth2loginrequest) | **GET** /admin/oauth2/auth/requests/login | Get OAuth 2.0 Login Request
[**getOAuth2LogoutRequest**](OAuth2API.md#getoauth2logoutrequest) | **GET** /admin/oauth2/auth/requests/logout | Get OAuth 2.0 Session Logout Request
[**getTrustedOAuth2JwtGrantIssuer**](OAuth2API.md#gettrustedoauth2jwtgrantissuer) | **GET** /admin/trust/grants/jwt-bearer/issuers/{id} | Get Trusted OAuth2 JWT Bearer Grant Type Issuer
[**introspectOAuth2Token**](OAuth2API.md#introspectoauth2token) | **POST** /admin/oauth2/introspect | Introspect OAuth2 Access and Refresh Tokens
[**listOAuth2Clients**](OAuth2API.md#listoauth2clients) | **GET** /admin/clients | List OAuth 2.0 Clients
[**listOAuth2ConsentSessions**](OAuth2API.md#listoauth2consentsessions) | **GET** /admin/oauth2/auth/sessions/consent | List OAuth 2.0 Consent Sessions of a Subject
[**listTrustedOAuth2JwtGrantIssuers**](OAuth2API.md#listtrustedoauth2jwtgrantissuers) | **GET** /admin/trust/grants/jwt-bearer/issuers | List Trusted OAuth2 JWT Bearer Grant Type Issuers
[**oAuth2Authorize**](OAuth2API.md#oauth2authorize) | **GET** /oauth2/auth | OAuth 2.0 Authorize Endpoint
[**oAuth2DeviceFlow**](OAuth2API.md#oauth2deviceflow) | **POST** /oauth2/device/auth | The OAuth 2.0 Device Authorize Endpoint
[**oauth2TokenExchange**](OAuth2API.md#oauth2tokenexchange) | **POST** /oauth2/token | The OAuth 2.0 Token Endpoint
[**patchOAuth2Client**](OAuth2API.md#patchoauth2client) | **PATCH** /admin/clients/{id} | Patch OAuth 2.0 Client
[**performOAuth2DeviceVerificationFlow**](OAuth2API.md#performoauth2deviceverificationflow) | **GET** /oauth2/device/verify | OAuth 2.0 Device Verification Endpoint
[**rejectOAuth2ConsentRequest**](OAuth2API.md#rejectoauth2consentrequest) | **PUT** /admin/oauth2/auth/requests/consent/reject | Reject OAuth 2.0 Consent Request
[**rejectOAuth2LoginRequest**](OAuth2API.md#rejectoauth2loginrequest) | **PUT** /admin/oauth2/auth/requests/login/reject | Reject OAuth 2.0 Login Request
[**rejectOAuth2LogoutRequest**](OAuth2API.md#rejectoauth2logoutrequest) | **PUT** /admin/oauth2/auth/requests/logout/reject | Reject OAuth 2.0 Session Logout Request
[**revokeOAuth2ConsentSessions**](OAuth2API.md#revokeoauth2consentsessions) | **DELETE** /admin/oauth2/auth/sessions/consent | Revoke OAuth 2.0 Consent Sessions of a Subject
[**revokeOAuth2LoginSessions**](OAuth2API.md#revokeoauth2loginsessions) | **DELETE** /admin/oauth2/auth/sessions/login | Revokes OAuth 2.0 Login Sessions by either a Subject or a SessionID
[**revokeOAuth2Token**](OAuth2API.md#revokeoauth2token) | **POST** /oauth2/revoke | Revoke OAuth 2.0 Access or Refresh Token
[**setOAuth2Client**](OAuth2API.md#setoauth2client) | **PUT** /admin/clients/{id} | Set OAuth 2.0 Client
[**setOAuth2ClientLifespans**](OAuth2API.md#setoauth2clientlifespans) | **PUT** /admin/clients/{id}/lifespans | Set OAuth2 Client Token Lifespans
[**trustOAuth2JwtGrantIssuer**](OAuth2API.md#trustoauth2jwtgrantissuer) | **POST** /admin/trust/grants/jwt-bearer/issuers | Trust OAuth2 JWT Bearer Grant Type Issuer


# **acceptOAuth2ConsentRequest**
```swift
    open class func acceptOAuth2ConsentRequest(consentChallenge: String, acceptOAuth2ConsentRequest: AcceptOAuth2ConsentRequest? = nil, completion: @escaping (_ data: OAuth2RedirectTo?, _ error: Error?) -> Void)
```

Accept OAuth 2.0 Consent Request

When an authorization code, hybrid, or implicit OAuth 2.0 Flow is initiated, Ory asks the login provider to authenticate the subject and then tell Ory now about it. If the subject authenticated, he/she must now be asked if the OAuth 2.0 Client which initiated the flow should be allowed to access the resources on the subject's behalf.  The consent challenge is appended to the consent provider's URL to which the subject's user-agent (browser) is redirected to. The consent provider uses that challenge to fetch information on the OAuth2 request and then tells Ory if the subject accepted or rejected the request.  This endpoint tells Ory that the subject has authorized the OAuth 2.0 client to access resources on his/her behalf. The consent provider includes additional information, such as session data for access and ID tokens, and if the consent request should be used as basis for future requests.  The response contains a redirect URL which the consent provider should redirect the user-agent to.  The default consent provider is available via the Ory Managed Account Experience. To customize the consent provider, please head over to the OAuth 2.0 documentation.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let consentChallenge = "consentChallenge_example" // String | OAuth 2.0 Consent Request Challenge
let acceptOAuth2ConsentRequest = acceptOAuth2ConsentRequest(context: 123, grantAccessTokenAudience: ["grantAccessTokenAudience_example"], grantScope: ["grantScope_example"], remember: false, rememberFor: 123, session: acceptOAuth2ConsentRequestSession(accessToken: 123, idToken: 123)) // AcceptOAuth2ConsentRequest |  (optional)

// Accept OAuth 2.0 Consent Request
OAuth2API.acceptOAuth2ConsentRequest(consentChallenge: consentChallenge, acceptOAuth2ConsentRequest: acceptOAuth2ConsentRequest) { (response, error) in
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
 **consentChallenge** | **String** | OAuth 2.0 Consent Request Challenge | 
 **acceptOAuth2ConsentRequest** | [**AcceptOAuth2ConsentRequest**](AcceptOAuth2ConsentRequest.md) |  | [optional] 

### Return type

[**OAuth2RedirectTo**](OAuth2RedirectTo.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **acceptOAuth2LoginRequest**
```swift
    open class func acceptOAuth2LoginRequest(loginChallenge: String, acceptOAuth2LoginRequest: AcceptOAuth2LoginRequest? = nil, completion: @escaping (_ data: OAuth2RedirectTo?, _ error: Error?) -> Void)
```

Accept OAuth 2.0 Login Request

When an authorization code, hybrid, or implicit OAuth 2.0 Flow is initiated, Ory asks the login provider to authenticate the subject and then tell the Ory OAuth2 Service about it.  The authentication challenge is appended to the login provider URL to which the subject's user-agent (browser) is redirected to. The login provider uses that challenge to fetch information on the OAuth2 request and then accept or reject the requested authentication process.  This endpoint tells Ory that the subject has successfully authenticated and includes additional information such as the subject's ID and if Ory should remember the subject's subject agent for future authentication attempts by setting a cookie.  The response contains a redirect URL which the login provider should redirect the user-agent to.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let loginChallenge = "loginChallenge_example" // String | OAuth 2.0 Login Request Challenge
let acceptOAuth2LoginRequest = acceptOAuth2LoginRequest(acr: "acr_example", amr: ["amr_example"], context: 123, extendSessionLifespan: false, forceSubjectIdentifier: "forceSubjectIdentifier_example", identityProviderSessionId: "identityProviderSessionId_example", remember: false, rememberFor: 123, subject: "subject_example") // AcceptOAuth2LoginRequest |  (optional)

// Accept OAuth 2.0 Login Request
OAuth2API.acceptOAuth2LoginRequest(loginChallenge: loginChallenge, acceptOAuth2LoginRequest: acceptOAuth2LoginRequest) { (response, error) in
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
 **loginChallenge** | **String** | OAuth 2.0 Login Request Challenge | 
 **acceptOAuth2LoginRequest** | [**AcceptOAuth2LoginRequest**](AcceptOAuth2LoginRequest.md) |  | [optional] 

### Return type

[**OAuth2RedirectTo**](OAuth2RedirectTo.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **acceptOAuth2LogoutRequest**
```swift
    open class func acceptOAuth2LogoutRequest(logoutChallenge: String, completion: @escaping (_ data: OAuth2RedirectTo?, _ error: Error?) -> Void)
```

Accept OAuth 2.0 Session Logout Request

When a user or an application requests Ory OAuth 2.0 to remove the session state of a subject, this endpoint is used to confirm that logout request.  The response contains a redirect URL which the consent provider should redirect the user-agent to.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let logoutChallenge = "logoutChallenge_example" // String | OAuth 2.0 Logout Request Challenge

// Accept OAuth 2.0 Session Logout Request
OAuth2API.acceptOAuth2LogoutRequest(logoutChallenge: logoutChallenge) { (response, error) in
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
 **logoutChallenge** | **String** | OAuth 2.0 Logout Request Challenge | 

### Return type

[**OAuth2RedirectTo**](OAuth2RedirectTo.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **acceptUserCodeRequest**
```swift
    open class func acceptUserCodeRequest(deviceChallenge: String, acceptDeviceUserCodeRequest: AcceptDeviceUserCodeRequest? = nil, completion: @escaping (_ data: OAuth2RedirectTo?, _ error: Error?) -> Void)
```

Accepts a device grant user_code request

Accepts a device grant user_code request

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let deviceChallenge = "deviceChallenge_example" // String | 
let acceptDeviceUserCodeRequest = acceptDeviceUserCodeRequest(userCode: "userCode_example") // AcceptDeviceUserCodeRequest |  (optional)

// Accepts a device grant user_code request
OAuth2API.acceptUserCodeRequest(deviceChallenge: deviceChallenge, acceptDeviceUserCodeRequest: acceptDeviceUserCodeRequest) { (response, error) in
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
 **deviceChallenge** | **String** |  | 
 **acceptDeviceUserCodeRequest** | [**AcceptDeviceUserCodeRequest**](AcceptDeviceUserCodeRequest.md) |  | [optional] 

### Return type

[**OAuth2RedirectTo**](OAuth2RedirectTo.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOAuth2Client**
```swift
    open class func createOAuth2Client(oAuth2Client: OAuth2Client, completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Create OAuth 2.0 Client

Create a new OAuth 2.0 client. If you pass `client_secret` the secret is used, otherwise a random secret is generated. The secret is echoed in the response. It is not possible to retrieve it later on.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let oAuth2Client = oAuth2Client(accessTokenStrategy: "accessTokenStrategy_example", allowedCorsOrigins: ["allowedCorsOrigins_example"], audience: ["audience_example"], authorizationCodeGrantAccessTokenLifespan: "authorizationCodeGrantAccessTokenLifespan_example", authorizationCodeGrantIdTokenLifespan: "authorizationCodeGrantIdTokenLifespan_example", authorizationCodeGrantRefreshTokenLifespan: "authorizationCodeGrantRefreshTokenLifespan_example", backchannelLogoutSessionRequired: false, backchannelLogoutUri: "backchannelLogoutUri_example", clientCredentialsGrantAccessTokenLifespan: "clientCredentialsGrantAccessTokenLifespan_example", clientId: "clientId_example", clientName: "clientName_example", clientSecret: "clientSecret_example", clientSecretExpiresAt: 123, clientUri: "clientUri_example", contacts: ["contacts_example"], createdAt: Date(), deviceAuthorizationGrantAccessTokenLifespan: "deviceAuthorizationGrantAccessTokenLifespan_example", deviceAuthorizationGrantIdTokenLifespan: "deviceAuthorizationGrantIdTokenLifespan_example", deviceAuthorizationGrantRefreshTokenLifespan: "deviceAuthorizationGrantRefreshTokenLifespan_example", frontchannelLogoutSessionRequired: false, frontchannelLogoutUri: "frontchannelLogoutUri_example", grantTypes: ["grantTypes_example"], implicitGrantAccessTokenLifespan: "implicitGrantAccessTokenLifespan_example", implicitGrantIdTokenLifespan: "implicitGrantIdTokenLifespan_example", jwks: jsonWebKeySet(keys: [jsonWebKey(alg: "alg_example", crv: "crv_example", d: "d_example", dp: "dp_example", dq: "dq_example", e: "e_example", k: "k_example", kid: "kid_example", kty: "kty_example", n: "n_example", p: "p_example", q: "q_example", qi: "qi_example", use: "use_example", x: "x_example", x5c: ["x5c_example"], y: "y_example")]), jwksUri: "jwksUri_example", jwtBearerGrantAccessTokenLifespan: "jwtBearerGrantAccessTokenLifespan_example", logoUri: "logoUri_example", metadata: 123, owner: "owner_example", policyUri: "policyUri_example", postLogoutRedirectUris: ["postLogoutRedirectUris_example"], redirectUris: ["redirectUris_example"], refreshTokenGrantAccessTokenLifespan: "refreshTokenGrantAccessTokenLifespan_example", refreshTokenGrantIdTokenLifespan: "refreshTokenGrantIdTokenLifespan_example", refreshTokenGrantRefreshTokenLifespan: "refreshTokenGrantRefreshTokenLifespan_example", registrationAccessToken: "registrationAccessToken_example", registrationClientUri: "registrationClientUri_example", requestObjectSigningAlg: "requestObjectSigningAlg_example", requestUris: ["requestUris_example"], responseTypes: ["responseTypes_example"], scope: "scope_example", sectorIdentifierUri: "sectorIdentifierUri_example", skipConsent: false, skipLogoutConsent: false, subjectType: "subjectType_example", tokenEndpointAuthMethod: "tokenEndpointAuthMethod_example", tokenEndpointAuthSigningAlg: "tokenEndpointAuthSigningAlg_example", tosUri: "tosUri_example", updatedAt: Date(), userinfoSignedResponseAlg: "userinfoSignedResponseAlg_example") // OAuth2Client | OAuth 2.0 Client Request Body

// Create OAuth 2.0 Client
OAuth2API.createOAuth2Client(oAuth2Client: oAuth2Client) { (response, error) in
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
 **oAuth2Client** | [**OAuth2Client**](OAuth2Client.md) | OAuth 2.0 Client Request Body | 

### Return type

[**OAuth2Client**](OAuth2Client.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOAuth2Client**
```swift
    open class func deleteOAuth2Client(id: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete OAuth 2.0 Client

Delete an existing OAuth 2.0 Client by its ID.  OAuth 2.0 clients are used to perform OAuth 2.0 and OpenID Connect flows. Usually, OAuth 2.0 clients are generated for applications which want to consume your OAuth 2.0 or OpenID Connect capabilities.  Make sure that this endpoint is well protected and only callable by first-party components.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id of the OAuth 2.0 Client.

// Delete OAuth 2.0 Client
OAuth2API.deleteOAuth2Client(id: id) { (response, error) in
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

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOAuth2Token**
```swift
    open class func deleteOAuth2Token(clientId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete OAuth 2.0 Access Tokens from specific OAuth 2.0 Client

This endpoint deletes OAuth2 access tokens issued to an OAuth 2.0 Client from the database.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let clientId = "clientId_example" // String | OAuth 2.0 Client ID

// Delete OAuth 2.0 Access Tokens from specific OAuth 2.0 Client
OAuth2API.deleteOAuth2Token(clientId: clientId) { (response, error) in
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
 **clientId** | **String** | OAuth 2.0 Client ID | 

### Return type

Void (empty response body)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteTrustedOAuth2JwtGrantIssuer**
```swift
    open class func deleteTrustedOAuth2JwtGrantIssuer(id: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Trusted OAuth2 JWT Bearer Grant Type Issuer

Use this endpoint to delete trusted JWT Bearer Grant Type Issuer. The ID is the one returned when you created the trust relationship.  Once deleted, the associated issuer will no longer be able to perform the JSON Web Token (JWT) Profile for OAuth 2.0 Client Authentication and Authorization Grant.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id of the desired grant

// Delete Trusted OAuth2 JWT Bearer Grant Type Issuer
OAuth2API.deleteTrustedOAuth2JwtGrantIssuer(id: id) { (response, error) in
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
 **id** | **String** | The id of the desired grant | 

### Return type

Void (empty response body)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOAuth2Client**
```swift
    open class func getOAuth2Client(id: String, completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Get an OAuth 2.0 Client

Get an OAuth 2.0 client by its ID. This endpoint never returns the client secret.  OAuth 2.0 clients are used to perform OAuth 2.0 and OpenID Connect flows. Usually, OAuth 2.0 clients are generated for applications which want to consume your OAuth 2.0 or OpenID Connect capabilities.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id of the OAuth 2.0 Client.

// Get an OAuth 2.0 Client
OAuth2API.getOAuth2Client(id: id) { (response, error) in
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

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOAuth2ConsentRequest**
```swift
    open class func getOAuth2ConsentRequest(consentChallenge: String, completion: @escaping (_ data: OAuth2ConsentRequest?, _ error: Error?) -> Void)
```

Get OAuth 2.0 Consent Request

When an authorization code, hybrid, or implicit OAuth 2.0 Flow is initiated, Ory asks the login provider to authenticate the subject and then tell Ory now about it. If the subject authenticated, he/she must now be asked if the OAuth 2.0 Client which initiated the flow should be allowed to access the resources on the subject's behalf.  The consent challenge is appended to the consent provider's URL to which the subject's user-agent (browser) is redirected to. The consent provider uses that challenge to fetch information on the OAuth2 request and then tells Ory if the subject accepted or rejected the request.  The default consent provider is available via the Ory Managed Account Experience. To customize the consent provider, please head over to the OAuth 2.0 documentation.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let consentChallenge = "consentChallenge_example" // String | OAuth 2.0 Consent Request Challenge

// Get OAuth 2.0 Consent Request
OAuth2API.getOAuth2ConsentRequest(consentChallenge: consentChallenge) { (response, error) in
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
 **consentChallenge** | **String** | OAuth 2.0 Consent Request Challenge | 

### Return type

[**OAuth2ConsentRequest**](OAuth2ConsentRequest.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOAuth2LoginRequest**
```swift
    open class func getOAuth2LoginRequest(loginChallenge: String, completion: @escaping (_ data: OAuth2LoginRequest?, _ error: Error?) -> Void)
```

Get OAuth 2.0 Login Request

When an authorization code, hybrid, or implicit OAuth 2.0 Flow is initiated, Ory asks the login provider to authenticate the subject and then tell the Ory OAuth2 Service about it.  Per default, the login provider is Ory itself. You may use a different login provider which needs to be a web-app you write and host, and it must be able to authenticate (\"show the subject a login screen\") a subject (in OAuth2 the proper name for subject is \"resource owner\").  The authentication challenge is appended to the login provider URL to which the subject's user-agent (browser) is redirected to. The login provider uses that challenge to fetch information on the OAuth2 request and then accept or reject the requested authentication process.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let loginChallenge = "loginChallenge_example" // String | OAuth 2.0 Login Request Challenge

// Get OAuth 2.0 Login Request
OAuth2API.getOAuth2LoginRequest(loginChallenge: loginChallenge) { (response, error) in
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
 **loginChallenge** | **String** | OAuth 2.0 Login Request Challenge | 

### Return type

[**OAuth2LoginRequest**](OAuth2LoginRequest.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOAuth2LogoutRequest**
```swift
    open class func getOAuth2LogoutRequest(logoutChallenge: String, completion: @escaping (_ data: OAuth2LogoutRequest?, _ error: Error?) -> Void)
```

Get OAuth 2.0 Session Logout Request

Use this endpoint to fetch an Ory OAuth 2.0 logout request.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let logoutChallenge = "logoutChallenge_example" // String | 

// Get OAuth 2.0 Session Logout Request
OAuth2API.getOAuth2LogoutRequest(logoutChallenge: logoutChallenge) { (response, error) in
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
 **logoutChallenge** | **String** |  | 

### Return type

[**OAuth2LogoutRequest**](OAuth2LogoutRequest.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTrustedOAuth2JwtGrantIssuer**
```swift
    open class func getTrustedOAuth2JwtGrantIssuer(id: String, completion: @escaping (_ data: TrustedOAuth2JwtGrantIssuer?, _ error: Error?) -> Void)
```

Get Trusted OAuth2 JWT Bearer Grant Type Issuer

Use this endpoint to get a trusted JWT Bearer Grant Type Issuer. The ID is the one returned when you created the trust relationship.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id of the desired grant

// Get Trusted OAuth2 JWT Bearer Grant Type Issuer
OAuth2API.getTrustedOAuth2JwtGrantIssuer(id: id) { (response, error) in
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
 **id** | **String** | The id of the desired grant | 

### Return type

[**TrustedOAuth2JwtGrantIssuer**](TrustedOAuth2JwtGrantIssuer.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **introspectOAuth2Token**
```swift
    open class func introspectOAuth2Token(token: String, scope: String? = nil, completion: @escaping (_ data: IntrospectedOAuth2Token?, _ error: Error?) -> Void)
```

Introspect OAuth2 Access and Refresh Tokens

The introspection endpoint allows to check if a token (both refresh and access) is active or not. An active token is neither expired nor revoked. If a token is active, additional information on the token will be included. You can set additional data for a token by setting `session.access_token` during the consent flow.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let token = "token_example" // String | The string value of the token. For access tokens, this is the \\\"access_token\\\" value returned from the token endpoint defined in OAuth 2.0. For refresh tokens, this is the \\\"refresh_token\\\" value returned.
let scope = "scope_example" // String | An optional, space separated list of required scopes. If the access token was not granted one of the scopes, the result of active will be false. (optional)

// Introspect OAuth2 Access and Refresh Tokens
OAuth2API.introspectOAuth2Token(token: token, scope: scope) { (response, error) in
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
 **token** | **String** | The string value of the token. For access tokens, this is the \\\&quot;access_token\\\&quot; value returned from the token endpoint defined in OAuth 2.0. For refresh tokens, this is the \\\&quot;refresh_token\\\&quot; value returned. | 
 **scope** | **String** | An optional, space separated list of required scopes. If the access token was not granted one of the scopes, the result of active will be false. | [optional] 

### Return type

[**IntrospectedOAuth2Token**](IntrospectedOAuth2Token.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOAuth2Clients**
```swift
    open class func listOAuth2Clients(pageSize: Int64? = nil, pageToken: String? = nil, clientName: String? = nil, owner: String? = nil, completion: @escaping (_ data: [OAuth2Client]?, _ error: Error?) -> Void)
```

List OAuth 2.0 Clients

This endpoint lists all clients in the database, and never returns client secrets. As a default it lists the first 100 clients.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let pageSize = 987 // Int64 | Items per Page  This is the number of items per page to return. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional) (default to 250)
let pageToken = "pageToken_example" // String | Next Page Token  The next page token. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional)
let clientName = "clientName_example" // String | The name of the clients to filter by. (optional)
let owner = "owner_example" // String | The owner of the clients to filter by. (optional)

// List OAuth 2.0 Clients
OAuth2API.listOAuth2Clients(pageSize: pageSize, pageToken: pageToken, clientName: clientName, owner: owner) { (response, error) in
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
 **pageSize** | **Int64** | Items per Page  This is the number of items per page to return. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). | [optional] [default to 250]
 **pageToken** | **String** | Next Page Token  The next page token. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). | [optional] 
 **clientName** | **String** | The name of the clients to filter by. | [optional] 
 **owner** | **String** | The owner of the clients to filter by. | [optional] 

### Return type

[**[OAuth2Client]**](OAuth2Client.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOAuth2ConsentSessions**
```swift
    open class func listOAuth2ConsentSessions(subject: String, pageSize: Int64? = nil, pageToken: String? = nil, loginSessionId: String? = nil, completion: @escaping (_ data: [OAuth2ConsentSession]?, _ error: Error?) -> Void)
```

List OAuth 2.0 Consent Sessions of a Subject

This endpoint lists all subject's granted consent sessions, including client and granted scope. If the subject is unknown or has not granted any consent sessions yet, the endpoint returns an empty JSON array with status code 200 OK.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let subject = "subject_example" // String | The subject to list the consent sessions for.
let pageSize = 987 // Int64 | Items per Page  This is the number of items per page to return. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional) (default to 250)
let pageToken = "pageToken_example" // String | Next Page Token  The next page token. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional) (default to "1")
let loginSessionId = "loginSessionId_example" // String | The login session id to list the consent sessions for. (optional)

// List OAuth 2.0 Consent Sessions of a Subject
OAuth2API.listOAuth2ConsentSessions(subject: subject, pageSize: pageSize, pageToken: pageToken, loginSessionId: loginSessionId) { (response, error) in
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
 **subject** | **String** | The subject to list the consent sessions for. | 
 **pageSize** | **Int64** | Items per Page  This is the number of items per page to return. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). | [optional] [default to 250]
 **pageToken** | **String** | Next Page Token  The next page token. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). | [optional] [default to &quot;1&quot;]
 **loginSessionId** | **String** | The login session id to list the consent sessions for. | [optional] 

### Return type

[**[OAuth2ConsentSession]**](OAuth2ConsentSession.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listTrustedOAuth2JwtGrantIssuers**
```swift
    open class func listTrustedOAuth2JwtGrantIssuers(pageSize: Int64? = nil, pageToken: String? = nil, issuer: String? = nil, completion: @escaping (_ data: [TrustedOAuth2JwtGrantIssuer]?, _ error: Error?) -> Void)
```

List Trusted OAuth2 JWT Bearer Grant Type Issuers

Use this endpoint to list all trusted JWT Bearer Grant Type Issuers.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let pageSize = 987 // Int64 | Items per Page  This is the number of items per page to return. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional) (default to 250)
let pageToken = "pageToken_example" // String | Next Page Token  The next page token. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional)
let issuer = "issuer_example" // String | If optional \"issuer\" is supplied, only jwt-bearer grants with this issuer will be returned. (optional)

// List Trusted OAuth2 JWT Bearer Grant Type Issuers
OAuth2API.listTrustedOAuth2JwtGrantIssuers(pageSize: pageSize, pageToken: pageToken, issuer: issuer) { (response, error) in
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
 **pageSize** | **Int64** | Items per Page  This is the number of items per page to return. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). | [optional] [default to 250]
 **pageToken** | **String** | Next Page Token  The next page token. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). | [optional] 
 **issuer** | **String** | If optional \&quot;issuer\&quot; is supplied, only jwt-bearer grants with this issuer will be returned. | [optional] 

### Return type

[**[TrustedOAuth2JwtGrantIssuer]**](TrustedOAuth2JwtGrantIssuer.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **oAuth2Authorize**
```swift
    open class func oAuth2Authorize(completion: @escaping (_ data: ErrorOAuth2?, _ error: Error?) -> Void)
```

OAuth 2.0 Authorize Endpoint

Use open source libraries to perform OAuth 2.0 and OpenID Connect available for any programming language. You can find a list of libraries at https://oauth.net/code/  This endpoint should not be used via the Ory SDK and is only included for technical reasons. Instead, use one of the libraries linked above.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// OAuth 2.0 Authorize Endpoint
OAuth2API.oAuth2Authorize() { (response, error) in
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

[**ErrorOAuth2**](ErrorOAuth2.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **oAuth2DeviceFlow**
```swift
    open class func oAuth2DeviceFlow(completion: @escaping (_ data: DeviceAuthorization?, _ error: Error?) -> Void)
```

The OAuth 2.0 Device Authorize Endpoint

This endpoint is not documented here because you should never use your own implementation to perform OAuth2 flows. OAuth2 is a very popular protocol and a library for your programming language will exist.  To learn more about this flow please refer to the specification: https://tools.ietf.org/html/rfc8628

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// The OAuth 2.0 Device Authorize Endpoint
OAuth2API.oAuth2DeviceFlow() { (response, error) in
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

[**DeviceAuthorization**](DeviceAuthorization.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **oauth2TokenExchange**
```swift
    open class func oauth2TokenExchange(grantType: String, clientId: String? = nil, code: String? = nil, redirectUri: String? = nil, refreshToken: String? = nil, completion: @escaping (_ data: OAuth2TokenExchange?, _ error: Error?) -> Void)
```

The OAuth 2.0 Token Endpoint

Use open source libraries to perform OAuth 2.0 and OpenID Connect available for any programming language. You can find a list of libraries here https://oauth.net/code/  This endpoint should not be used via the Ory SDK and is only included for technical reasons. Instead, use one of the libraries linked above.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let grantType = "grantType_example" // String | 
let clientId = "clientId_example" // String |  (optional)
let code = "code_example" // String |  (optional)
let redirectUri = "redirectUri_example" // String |  (optional)
let refreshToken = "refreshToken_example" // String |  (optional)

// The OAuth 2.0 Token Endpoint
OAuth2API.oauth2TokenExchange(grantType: grantType, clientId: clientId, code: code, redirectUri: redirectUri, refreshToken: refreshToken) { (response, error) in
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
 **grantType** | **String** |  | 
 **clientId** | **String** |  | [optional] 
 **code** | **String** |  | [optional] 
 **redirectUri** | **String** |  | [optional] 
 **refreshToken** | **String** |  | [optional] 

### Return type

[**OAuth2TokenExchange**](OAuth2TokenExchange.md)

### Authorization

[basic](../README.md#basic), [oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchOAuth2Client**
```swift
    open class func patchOAuth2Client(id: String, jsonPatch: [JsonPatch], completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Patch OAuth 2.0 Client

Patch an existing OAuth 2.0 Client using JSON Patch. If you pass `client_secret` the secret will be updated and returned via the API. This is the only time you will be able to retrieve the client secret, so write it down and keep it safe.  OAuth 2.0 clients are used to perform OAuth 2.0 and OpenID Connect flows. Usually, OAuth 2.0 clients are generated for applications which want to consume your OAuth 2.0 or OpenID Connect capabilities.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | The id of the OAuth 2.0 Client.
let jsonPatch = [jsonPatch(from: "from_example", op: "op_example", path: "path_example", value: 123)] // [JsonPatch] | OAuth 2.0 Client JSON Patch Body

// Patch OAuth 2.0 Client
OAuth2API.patchOAuth2Client(id: id, jsonPatch: jsonPatch) { (response, error) in
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
 **jsonPatch** | [**[JsonPatch]**](JsonPatch.md) | OAuth 2.0 Client JSON Patch Body | 

### Return type

[**OAuth2Client**](OAuth2Client.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **performOAuth2DeviceVerificationFlow**
```swift
    open class func performOAuth2DeviceVerificationFlow(completion: @escaping (_ data: ErrorOAuth2?, _ error: Error?) -> Void)
```

OAuth 2.0 Device Verification Endpoint

This is the device user verification endpoint. The user is redirected here when trying to log in using the device flow.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// OAuth 2.0 Device Verification Endpoint
OAuth2API.performOAuth2DeviceVerificationFlow() { (response, error) in
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

[**ErrorOAuth2**](ErrorOAuth2.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rejectOAuth2ConsentRequest**
```swift
    open class func rejectOAuth2ConsentRequest(consentChallenge: String, rejectOAuth2Request: RejectOAuth2Request? = nil, completion: @escaping (_ data: OAuth2RedirectTo?, _ error: Error?) -> Void)
```

Reject OAuth 2.0 Consent Request

When an authorization code, hybrid, or implicit OAuth 2.0 Flow is initiated, Ory asks the login provider to authenticate the subject and then tell Ory now about it. If the subject authenticated, he/she must now be asked if the OAuth 2.0 Client which initiated the flow should be allowed to access the resources on the subject's behalf.  The consent challenge is appended to the consent provider's URL to which the subject's user-agent (browser) is redirected to. The consent provider uses that challenge to fetch information on the OAuth2 request and then tells Ory if the subject accepted or rejected the request.  This endpoint tells Ory that the subject has not authorized the OAuth 2.0 client to access resources on his/her behalf. The consent provider must include a reason why the consent was not granted.  The response contains a redirect URL which the consent provider should redirect the user-agent to.  The default consent provider is available via the Ory Managed Account Experience. To customize the consent provider, please head over to the OAuth 2.0 documentation.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let consentChallenge = "consentChallenge_example" // String | OAuth 2.0 Consent Request Challenge
let rejectOAuth2Request = rejectOAuth2Request(error: "error_example", errorDebug: "errorDebug_example", errorDescription: "errorDescription_example", errorHint: "errorHint_example", statusCode: 123) // RejectOAuth2Request |  (optional)

// Reject OAuth 2.0 Consent Request
OAuth2API.rejectOAuth2ConsentRequest(consentChallenge: consentChallenge, rejectOAuth2Request: rejectOAuth2Request) { (response, error) in
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
 **consentChallenge** | **String** | OAuth 2.0 Consent Request Challenge | 
 **rejectOAuth2Request** | [**RejectOAuth2Request**](RejectOAuth2Request.md) |  | [optional] 

### Return type

[**OAuth2RedirectTo**](OAuth2RedirectTo.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rejectOAuth2LoginRequest**
```swift
    open class func rejectOAuth2LoginRequest(loginChallenge: String, rejectOAuth2Request: RejectOAuth2Request? = nil, completion: @escaping (_ data: OAuth2RedirectTo?, _ error: Error?) -> Void)
```

Reject OAuth 2.0 Login Request

When an authorization code, hybrid, or implicit OAuth 2.0 Flow is initiated, Ory asks the login provider to authenticate the subject and then tell the Ory OAuth2 Service about it.  The authentication challenge is appended to the login provider URL to which the subject's user-agent (browser) is redirected to. The login provider uses that challenge to fetch information on the OAuth2 request and then accept or reject the requested authentication process.  This endpoint tells Ory that the subject has not authenticated and includes a reason why the authentication was denied.  The response contains a redirect URL which the login provider should redirect the user-agent to.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let loginChallenge = "loginChallenge_example" // String | OAuth 2.0 Login Request Challenge
let rejectOAuth2Request = rejectOAuth2Request(error: "error_example", errorDebug: "errorDebug_example", errorDescription: "errorDescription_example", errorHint: "errorHint_example", statusCode: 123) // RejectOAuth2Request |  (optional)

// Reject OAuth 2.0 Login Request
OAuth2API.rejectOAuth2LoginRequest(loginChallenge: loginChallenge, rejectOAuth2Request: rejectOAuth2Request) { (response, error) in
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
 **loginChallenge** | **String** | OAuth 2.0 Login Request Challenge | 
 **rejectOAuth2Request** | [**RejectOAuth2Request**](RejectOAuth2Request.md) |  | [optional] 

### Return type

[**OAuth2RedirectTo**](OAuth2RedirectTo.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rejectOAuth2LogoutRequest**
```swift
    open class func rejectOAuth2LogoutRequest(logoutChallenge: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Reject OAuth 2.0 Session Logout Request

When a user or an application requests Ory OAuth 2.0 to remove the session state of a subject, this endpoint is used to deny that logout request. No HTTP request body is required.  The response is empty as the logout provider has to chose what action to perform next.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let logoutChallenge = "logoutChallenge_example" // String | 

// Reject OAuth 2.0 Session Logout Request
OAuth2API.rejectOAuth2LogoutRequest(logoutChallenge: logoutChallenge) { (response, error) in
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
 **logoutChallenge** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeOAuth2ConsentSessions**
```swift
    open class func revokeOAuth2ConsentSessions(subject: String? = nil, client: String? = nil, consentRequestId: String? = nil, all: Bool? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Revoke OAuth 2.0 Consent Sessions of a Subject

This endpoint revokes a subject's granted consent sessions and invalidates all associated OAuth 2.0 Access Tokens. You may also only revoke sessions for a specific OAuth 2.0 Client ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let subject = "subject_example" // String | OAuth 2.0 Consent Subject  The subject whose consent sessions should be deleted. (optional)
let client = "client_example" // String | OAuth 2.0 Client ID  If set, deletes only those consent sessions that have been granted to the specified OAuth 2.0 Client ID. (optional)
let consentRequestId = "consentRequestId_example" // String | Consent Request ID  If set, revoke all token chains derived from this particular consent request ID. (optional)
let all = true // Bool | Revoke All Consent Sessions  If set to `true` deletes all consent sessions by the Subject that have been granted. (optional)

// Revoke OAuth 2.0 Consent Sessions of a Subject
OAuth2API.revokeOAuth2ConsentSessions(subject: subject, client: client, consentRequestId: consentRequestId, all: all) { (response, error) in
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
 **subject** | **String** | OAuth 2.0 Consent Subject  The subject whose consent sessions should be deleted. | [optional] 
 **client** | **String** | OAuth 2.0 Client ID  If set, deletes only those consent sessions that have been granted to the specified OAuth 2.0 Client ID. | [optional] 
 **consentRequestId** | **String** | Consent Request ID  If set, revoke all token chains derived from this particular consent request ID. | [optional] 
 **all** | **Bool** | Revoke All Consent Sessions  If set to &#x60;true&#x60; deletes all consent sessions by the Subject that have been granted. | [optional] 

### Return type

Void (empty response body)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeOAuth2LoginSessions**
```swift
    open class func revokeOAuth2LoginSessions(subject: String? = nil, sid: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Revokes OAuth 2.0 Login Sessions by either a Subject or a SessionID

This endpoint invalidates authentication sessions. After revoking the authentication session(s), the subject has to re-authenticate at the Ory OAuth2 Provider. This endpoint does not invalidate any tokens.  If you send the subject in a query param, all authentication sessions that belong to that subject are revoked. No OpenID Connect Front- or Back-channel logout is performed in this case.  Alternatively, you can send a SessionID via `sid` query param, in which case, only the session that is connected to that SessionID is revoked. OpenID Connect Back-channel logout is performed in this case.  When using Ory for the identity provider, the login provider will also invalidate the session cookie.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let subject = "subject_example" // String | OAuth 2.0 Subject  The subject to revoke authentication sessions for. (optional)
let sid = "sid_example" // String | Login Session ID  The login session to revoke. (optional)

// Revokes OAuth 2.0 Login Sessions by either a Subject or a SessionID
OAuth2API.revokeOAuth2LoginSessions(subject: subject, sid: sid) { (response, error) in
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
 **subject** | **String** | OAuth 2.0 Subject  The subject to revoke authentication sessions for. | [optional] 
 **sid** | **String** | Login Session ID  The login session to revoke. | [optional] 

### Return type

Void (empty response body)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeOAuth2Token**
```swift
    open class func revokeOAuth2Token(token: String, clientId: String? = nil, clientSecret: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Revoke OAuth 2.0 Access or Refresh Token

Revoking a token (both access and refresh) means that the tokens will be invalid. A revoked access token can no longer be used to make access requests, and a revoked refresh token can no longer be used to refresh an access token. Revoking a refresh token also invalidates the access token that was created with it. A token may only be revoked by the client the token was generated for.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let token = "token_example" // String | 
let clientId = "clientId_example" // String |  (optional)
let clientSecret = "clientSecret_example" // String |  (optional)

// Revoke OAuth 2.0 Access or Refresh Token
OAuth2API.revokeOAuth2Token(token: token, clientId: clientId, clientSecret: clientSecret) { (response, error) in
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
 **token** | **String** |  | 
 **clientId** | **String** |  | [optional] 
 **clientSecret** | **String** |  | [optional] 

### Return type

Void (empty response body)

### Authorization

[basic](../README.md#basic), [oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setOAuth2Client**
```swift
    open class func setOAuth2Client(id: String, oAuth2Client: OAuth2Client, completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Set OAuth 2.0 Client

Replaces an existing OAuth 2.0 Client with the payload you send. If you pass `client_secret` the secret is used, otherwise the existing secret is used.  If set, the secret is echoed in the response. It is not possible to retrieve it later on.  OAuth 2.0 Clients are used to perform OAuth 2.0 and OpenID Connect flows. Usually, OAuth 2.0 clients are generated for applications which want to consume your OAuth 2.0 or OpenID Connect capabilities.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | OAuth 2.0 Client ID
let oAuth2Client = oAuth2Client(accessTokenStrategy: "accessTokenStrategy_example", allowedCorsOrigins: ["allowedCorsOrigins_example"], audience: ["audience_example"], authorizationCodeGrantAccessTokenLifespan: "authorizationCodeGrantAccessTokenLifespan_example", authorizationCodeGrantIdTokenLifespan: "authorizationCodeGrantIdTokenLifespan_example", authorizationCodeGrantRefreshTokenLifespan: "authorizationCodeGrantRefreshTokenLifespan_example", backchannelLogoutSessionRequired: false, backchannelLogoutUri: "backchannelLogoutUri_example", clientCredentialsGrantAccessTokenLifespan: "clientCredentialsGrantAccessTokenLifespan_example", clientId: "clientId_example", clientName: "clientName_example", clientSecret: "clientSecret_example", clientSecretExpiresAt: 123, clientUri: "clientUri_example", contacts: ["contacts_example"], createdAt: Date(), deviceAuthorizationGrantAccessTokenLifespan: "deviceAuthorizationGrantAccessTokenLifespan_example", deviceAuthorizationGrantIdTokenLifespan: "deviceAuthorizationGrantIdTokenLifespan_example", deviceAuthorizationGrantRefreshTokenLifespan: "deviceAuthorizationGrantRefreshTokenLifespan_example", frontchannelLogoutSessionRequired: false, frontchannelLogoutUri: "frontchannelLogoutUri_example", grantTypes: ["grantTypes_example"], implicitGrantAccessTokenLifespan: "implicitGrantAccessTokenLifespan_example", implicitGrantIdTokenLifespan: "implicitGrantIdTokenLifespan_example", jwks: jsonWebKeySet(keys: [jsonWebKey(alg: "alg_example", crv: "crv_example", d: "d_example", dp: "dp_example", dq: "dq_example", e: "e_example", k: "k_example", kid: "kid_example", kty: "kty_example", n: "n_example", p: "p_example", q: "q_example", qi: "qi_example", use: "use_example", x: "x_example", x5c: ["x5c_example"], y: "y_example")]), jwksUri: "jwksUri_example", jwtBearerGrantAccessTokenLifespan: "jwtBearerGrantAccessTokenLifespan_example", logoUri: "logoUri_example", metadata: 123, owner: "owner_example", policyUri: "policyUri_example", postLogoutRedirectUris: ["postLogoutRedirectUris_example"], redirectUris: ["redirectUris_example"], refreshTokenGrantAccessTokenLifespan: "refreshTokenGrantAccessTokenLifespan_example", refreshTokenGrantIdTokenLifespan: "refreshTokenGrantIdTokenLifespan_example", refreshTokenGrantRefreshTokenLifespan: "refreshTokenGrantRefreshTokenLifespan_example", registrationAccessToken: "registrationAccessToken_example", registrationClientUri: "registrationClientUri_example", requestObjectSigningAlg: "requestObjectSigningAlg_example", requestUris: ["requestUris_example"], responseTypes: ["responseTypes_example"], scope: "scope_example", sectorIdentifierUri: "sectorIdentifierUri_example", skipConsent: false, skipLogoutConsent: false, subjectType: "subjectType_example", tokenEndpointAuthMethod: "tokenEndpointAuthMethod_example", tokenEndpointAuthSigningAlg: "tokenEndpointAuthSigningAlg_example", tosUri: "tosUri_example", updatedAt: Date(), userinfoSignedResponseAlg: "userinfoSignedResponseAlg_example") // OAuth2Client | OAuth 2.0 Client Request Body

// Set OAuth 2.0 Client
OAuth2API.setOAuth2Client(id: id, oAuth2Client: oAuth2Client) { (response, error) in
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

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setOAuth2ClientLifespans**
```swift
    open class func setOAuth2ClientLifespans(id: String, oAuth2ClientTokenLifespans: OAuth2ClientTokenLifespans? = nil, completion: @escaping (_ data: OAuth2Client?, _ error: Error?) -> Void)
```

Set OAuth2 Client Token Lifespans

Set lifespans of different token types issued for this OAuth 2.0 client. Does not modify other fields.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let id = "id_example" // String | OAuth 2.0 Client ID
let oAuth2ClientTokenLifespans = oAuth2ClientTokenLifespans(authorizationCodeGrantAccessTokenLifespan: "authorizationCodeGrantAccessTokenLifespan_example", authorizationCodeGrantIdTokenLifespan: "authorizationCodeGrantIdTokenLifespan_example", authorizationCodeGrantRefreshTokenLifespan: "authorizationCodeGrantRefreshTokenLifespan_example", clientCredentialsGrantAccessTokenLifespan: "clientCredentialsGrantAccessTokenLifespan_example", deviceAuthorizationGrantAccessTokenLifespan: "deviceAuthorizationGrantAccessTokenLifespan_example", deviceAuthorizationGrantIdTokenLifespan: "deviceAuthorizationGrantIdTokenLifespan_example", deviceAuthorizationGrantRefreshTokenLifespan: "deviceAuthorizationGrantRefreshTokenLifespan_example", implicitGrantAccessTokenLifespan: "implicitGrantAccessTokenLifespan_example", implicitGrantIdTokenLifespan: "implicitGrantIdTokenLifespan_example", jwtBearerGrantAccessTokenLifespan: "jwtBearerGrantAccessTokenLifespan_example", refreshTokenGrantAccessTokenLifespan: "refreshTokenGrantAccessTokenLifespan_example", refreshTokenGrantIdTokenLifespan: "refreshTokenGrantIdTokenLifespan_example", refreshTokenGrantRefreshTokenLifespan: "refreshTokenGrantRefreshTokenLifespan_example") // OAuth2ClientTokenLifespans |  (optional)

// Set OAuth2 Client Token Lifespans
OAuth2API.setOAuth2ClientLifespans(id: id, oAuth2ClientTokenLifespans: oAuth2ClientTokenLifespans) { (response, error) in
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
 **oAuth2ClientTokenLifespans** | [**OAuth2ClientTokenLifespans**](OAuth2ClientTokenLifespans.md) |  | [optional] 

### Return type

[**OAuth2Client**](OAuth2Client.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **trustOAuth2JwtGrantIssuer**
```swift
    open class func trustOAuth2JwtGrantIssuer(trustOAuth2JwtGrantIssuer: TrustOAuth2JwtGrantIssuer? = nil, completion: @escaping (_ data: TrustedOAuth2JwtGrantIssuer?, _ error: Error?) -> Void)
```

Trust OAuth2 JWT Bearer Grant Type Issuer

Use this endpoint to establish a trust relationship for a JWT issuer to perform JSON Web Token (JWT) Profile for OAuth 2.0 Client Authentication and Authorization Grants [RFC7523](https://datatracker.ietf.org/doc/html/rfc7523).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let trustOAuth2JwtGrantIssuer = trustOAuth2JwtGrantIssuer(allowAnySubject: false, expiresAt: Date(), issuer: "issuer_example", jwk: jsonWebKey(alg: "alg_example", crv: "crv_example", d: "d_example", dp: "dp_example", dq: "dq_example", e: "e_example", k: "k_example", kid: "kid_example", kty: "kty_example", n: "n_example", p: "p_example", q: "q_example", qi: "qi_example", use: "use_example", x: "x_example", x5c: ["x5c_example"], y: "y_example"), scope: ["scope_example"], subject: "subject_example") // TrustOAuth2JwtGrantIssuer |  (optional)

// Trust OAuth2 JWT Bearer Grant Type Issuer
OAuth2API.trustOAuth2JwtGrantIssuer(trustOAuth2JwtGrantIssuer: trustOAuth2JwtGrantIssuer) { (response, error) in
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
 **trustOAuth2JwtGrantIssuer** | [**TrustOAuth2JwtGrantIssuer**](TrustOAuth2JwtGrantIssuer.md) |  | [optional] 

### Return type

[**TrustedOAuth2JwtGrantIssuer**](TrustedOAuth2JwtGrantIssuer.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

