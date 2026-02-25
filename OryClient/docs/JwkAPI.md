# JwkAPI

All URIs are relative to *https://playground.projects.oryapis.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createJsonWebKeySet**](JwkAPI.md#createjsonwebkeyset) | **POST** /admin/keys/{set} | Create JSON Web Key
[**deleteJsonWebKey**](JwkAPI.md#deletejsonwebkey) | **DELETE** /admin/keys/{set}/{kid} | Delete JSON Web Key
[**deleteJsonWebKeySet**](JwkAPI.md#deletejsonwebkeyset) | **DELETE** /admin/keys/{set} | Delete JSON Web Key Set
[**getJsonWebKey**](JwkAPI.md#getjsonwebkey) | **GET** /admin/keys/{set}/{kid} | Get JSON Web Key
[**getJsonWebKeySet**](JwkAPI.md#getjsonwebkeyset) | **GET** /admin/keys/{set} | Retrieve a JSON Web Key Set
[**setJsonWebKey**](JwkAPI.md#setjsonwebkey) | **PUT** /admin/keys/{set}/{kid} | Set JSON Web Key
[**setJsonWebKeySet**](JwkAPI.md#setjsonwebkeyset) | **PUT** /admin/keys/{set} | Update a JSON Web Key Set


# **createJsonWebKeySet**
```swift
    open class func createJsonWebKeySet(_set: String, createJsonWebKeySet: CreateJsonWebKeySet, completion: @escaping (_ data: JsonWebKeySet?, _ error: Error?) -> Void)
```

Create JSON Web Key

This endpoint is capable of generating JSON Web Key Sets for you. There are different strategies available, such as symmetric cryptographic keys (HS256, HS512) and asymmetric cryptographic keys (RS256, ECDSA). If the specified JSON Web Key Set does not exist, it will be created.  A JSON Web Key (JWK) is a JavaScript Object Notation (JSON) data structure that represents a cryptographic key. A JWK Set is a JSON data structure that represents a set of JWKs. A JSON Web Key is identified by its set and key id. ORY Hydra uses this functionality to store cryptographic keys used for TLS and JSON Web Tokens (such as OpenID Connect ID tokens), and allows storing user-defined keys as well.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let _set = "_set_example" // String | The JSON Web Key Set ID
let createJsonWebKeySet = createJsonWebKeySet(alg: "alg_example", kid: "kid_example", use: "use_example") // CreateJsonWebKeySet | 

// Create JSON Web Key
JwkAPI.createJsonWebKeySet(_set: _set, createJsonWebKeySet: createJsonWebKeySet) { (response, error) in
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
 **_set** | **String** | The JSON Web Key Set ID | 
 **createJsonWebKeySet** | [**CreateJsonWebKeySet**](CreateJsonWebKeySet.md) |  | 

### Return type

[**JsonWebKeySet**](JsonWebKeySet.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteJsonWebKey**
```swift
    open class func deleteJsonWebKey(_set: String, kid: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete JSON Web Key

Use this endpoint to delete a single JSON Web Key.  A JSON Web Key (JWK) is a JavaScript Object Notation (JSON) data structure that represents a cryptographic key. A JWK Set is a JSON data structure that represents a set of JWKs. A JSON Web Key is identified by its set and key id. ORY Hydra uses this functionality to store cryptographic keys used for TLS and JSON Web Tokens (such as OpenID Connect ID tokens), and allows storing user-defined keys as well.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let _set = "_set_example" // String | The JSON Web Key Set
let kid = "kid_example" // String | The JSON Web Key ID (kid)

// Delete JSON Web Key
JwkAPI.deleteJsonWebKey(_set: _set, kid: kid) { (response, error) in
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
 **_set** | **String** | The JSON Web Key Set | 
 **kid** | **String** | The JSON Web Key ID (kid) | 

### Return type

Void (empty response body)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteJsonWebKeySet**
```swift
    open class func deleteJsonWebKeySet(_set: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete JSON Web Key Set

Use this endpoint to delete a complete JSON Web Key Set and all the keys in that set.  A JSON Web Key (JWK) is a JavaScript Object Notation (JSON) data structure that represents a cryptographic key. A JWK Set is a JSON data structure that represents a set of JWKs. A JSON Web Key is identified by its set and key id. ORY Hydra uses this functionality to store cryptographic keys used for TLS and JSON Web Tokens (such as OpenID Connect ID tokens), and allows storing user-defined keys as well.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let _set = "_set_example" // String | The JSON Web Key Set

// Delete JSON Web Key Set
JwkAPI.deleteJsonWebKeySet(_set: _set) { (response, error) in
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
 **_set** | **String** | The JSON Web Key Set | 

### Return type

Void (empty response body)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getJsonWebKey**
```swift
    open class func getJsonWebKey(_set: String, kid: String, completion: @escaping (_ data: JsonWebKeySet?, _ error: Error?) -> Void)
```

Get JSON Web Key

This endpoint returns a singular JSON Web Key contained in a set. It is identified by the set and the specific key ID (kid).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let _set = "_set_example" // String | JSON Web Key Set ID
let kid = "kid_example" // String | JSON Web Key ID

// Get JSON Web Key
JwkAPI.getJsonWebKey(_set: _set, kid: kid) { (response, error) in
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
 **_set** | **String** | JSON Web Key Set ID | 
 **kid** | **String** | JSON Web Key ID | 

### Return type

[**JsonWebKeySet**](JsonWebKeySet.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getJsonWebKeySet**
```swift
    open class func getJsonWebKeySet(_set: String, completion: @escaping (_ data: JsonWebKeySet?, _ error: Error?) -> Void)
```

Retrieve a JSON Web Key Set

This endpoint can be used to retrieve JWK Sets stored in ORY Hydra.  A JSON Web Key (JWK) is a JavaScript Object Notation (JSON) data structure that represents a cryptographic key. A JWK Set is a JSON data structure that represents a set of JWKs. A JSON Web Key is identified by its set and key id. ORY Hydra uses this functionality to store cryptographic keys used for TLS and JSON Web Tokens (such as OpenID Connect ID tokens), and allows storing user-defined keys as well.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let _set = "_set_example" // String | JSON Web Key Set ID

// Retrieve a JSON Web Key Set
JwkAPI.getJsonWebKeySet(_set: _set) { (response, error) in
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
 **_set** | **String** | JSON Web Key Set ID | 

### Return type

[**JsonWebKeySet**](JsonWebKeySet.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setJsonWebKey**
```swift
    open class func setJsonWebKey(_set: String, kid: String, jsonWebKey: JsonWebKey? = nil, completion: @escaping (_ data: JsonWebKey?, _ error: Error?) -> Void)
```

Set JSON Web Key

Use this method if you do not want to let Hydra generate the JWKs for you, but instead save your own.  A JSON Web Key (JWK) is a JavaScript Object Notation (JSON) data structure that represents a cryptographic key. A JWK Set is a JSON data structure that represents a set of JWKs. A JSON Web Key is identified by its set and key id. ORY Hydra uses this functionality to store cryptographic keys used for TLS and JSON Web Tokens (such as OpenID Connect ID tokens), and allows storing user-defined keys as well.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let _set = "_set_example" // String | The JSON Web Key Set ID
let kid = "kid_example" // String | JSON Web Key ID
let jsonWebKey = jsonWebKey(alg: "alg_example", crv: "crv_example", d: "d_example", dp: "dp_example", dq: "dq_example", e: "e_example", k: "k_example", kid: "kid_example", kty: "kty_example", n: "n_example", p: "p_example", q: "q_example", qi: "qi_example", use: "use_example", x: "x_example", x5c: ["x5c_example"], y: "y_example") // JsonWebKey |  (optional)

// Set JSON Web Key
JwkAPI.setJsonWebKey(_set: _set, kid: kid, jsonWebKey: jsonWebKey) { (response, error) in
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
 **_set** | **String** | The JSON Web Key Set ID | 
 **kid** | **String** | JSON Web Key ID | 
 **jsonWebKey** | [**JsonWebKey**](JsonWebKey.md) |  | [optional] 

### Return type

[**JsonWebKey**](JsonWebKey.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setJsonWebKeySet**
```swift
    open class func setJsonWebKeySet(_set: String, jsonWebKeySet: JsonWebKeySet? = nil, completion: @escaping (_ data: JsonWebKeySet?, _ error: Error?) -> Void)
```

Update a JSON Web Key Set

Use this method if you do not want to let Hydra generate the JWKs for you, but instead save your own.  A JSON Web Key (JWK) is a JavaScript Object Notation (JSON) data structure that represents a cryptographic key. A JWK Set is a JSON data structure that represents a set of JWKs. A JSON Web Key is identified by its set and key id. ORY Hydra uses this functionality to store cryptographic keys used for TLS and JSON Web Tokens (such as OpenID Connect ID tokens), and allows storing user-defined keys as well.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let _set = "_set_example" // String | The JSON Web Key Set ID
let jsonWebKeySet = jsonWebKeySet(keys: [jsonWebKey(alg: "alg_example", crv: "crv_example", d: "d_example", dp: "dp_example", dq: "dq_example", e: "e_example", k: "k_example", kid: "kid_example", kty: "kty_example", n: "n_example", p: "p_example", q: "q_example", qi: "qi_example", use: "use_example", x: "x_example", x5c: ["x5c_example"], y: "y_example")]) // JsonWebKeySet |  (optional)

// Update a JSON Web Key Set
JwkAPI.setJsonWebKeySet(_set: _set, jsonWebKeySet: jsonWebKeySet) { (response, error) in
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
 **_set** | **String** | The JSON Web Key Set ID | 
 **jsonWebKeySet** | [**JsonWebKeySet**](JsonWebKeySet.md) |  | [optional] 

### Return type

[**JsonWebKeySet**](JsonWebKeySet.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

