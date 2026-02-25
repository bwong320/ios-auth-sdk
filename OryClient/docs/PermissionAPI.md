# PermissionAPI

All URIs are relative to *https://playground.projects.oryapis.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**batchCheckPermission**](PermissionAPI.md#batchcheckpermission) | **POST** /relation-tuples/batch/check | Batch check permissions
[**checkPermission**](PermissionAPI.md#checkpermission) | **GET** /relation-tuples/check/openapi | Check a permission
[**checkPermissionOrError**](PermissionAPI.md#checkpermissionorerror) | **GET** /relation-tuples/check | Check a permission
[**expandPermissions**](PermissionAPI.md#expandpermissions) | **GET** /relation-tuples/expand | Expand a Relationship into permissions.
[**postCheckPermission**](PermissionAPI.md#postcheckpermission) | **POST** /relation-tuples/check/openapi | Check a permission
[**postCheckPermissionOrError**](PermissionAPI.md#postcheckpermissionorerror) | **POST** /relation-tuples/check | Check a permission


# **batchCheckPermission**
```swift
    open class func batchCheckPermission(maxDepth: Int64? = nil, batchCheckPermissionBody: BatchCheckPermissionBody? = nil, completion: @escaping (_ data: BatchCheckPermissionResult?, _ error: Error?) -> Void)
```

Batch check permissions

To learn how relationship tuples and the check works, head over to [the documentation](https://www.ory.sh/docs/keto/concepts/api-overview).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let maxDepth = 987 // Int64 |  (optional)
let batchCheckPermissionBody = batchCheckPermissionBody(tuples: [relationship(namespace: "namespace_example", object: "object_example", relation: "relation_example", subjectId: "subjectId_example", subjectSet: subjectSet(namespace: "namespace_example", object: "object_example", relation: "relation_example"))]) // BatchCheckPermissionBody |  (optional)

// Batch check permissions
PermissionAPI.batchCheckPermission(maxDepth: maxDepth, batchCheckPermissionBody: batchCheckPermissionBody) { (response, error) in
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
 **maxDepth** | **Int64** |  | [optional] 
 **batchCheckPermissionBody** | [**BatchCheckPermissionBody**](BatchCheckPermissionBody.md) |  | [optional] 

### Return type

[**BatchCheckPermissionResult**](BatchCheckPermissionResult.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkPermission**
```swift
    open class func checkPermission(namespace: String? = nil, object: String? = nil, relation: String? = nil, subjectId: String? = nil, subjectSetNamespace: String? = nil, subjectSetObject: String? = nil, subjectSetRelation: String? = nil, maxDepth: Int64? = nil, completion: @escaping (_ data: CheckPermissionResult?, _ error: Error?) -> Void)
```

Check a permission

To learn how relationship tuples and the check works, head over to [the documentation](https://www.ory.sh/docs/keto/concepts/api-overview).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let namespace = "namespace_example" // String | Namespace of the Relationship (optional)
let object = "object_example" // String | Object of the Relationship (optional)
let relation = "relation_example" // String | Relation of the Relationship (optional)
let subjectId = "subjectId_example" // String | SubjectID of the Relationship (optional)
let subjectSetNamespace = "subjectSetNamespace_example" // String | Namespace of the Subject Set (optional)
let subjectSetObject = "subjectSetObject_example" // String | Object of the Subject Set (optional)
let subjectSetRelation = "subjectSetRelation_example" // String | Relation of the Subject Set (optional)
let maxDepth = 987 // Int64 |  (optional)

// Check a permission
PermissionAPI.checkPermission(namespace: namespace, object: object, relation: relation, subjectId: subjectId, subjectSetNamespace: subjectSetNamespace, subjectSetObject: subjectSetObject, subjectSetRelation: subjectSetRelation, maxDepth: maxDepth) { (response, error) in
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
 **namespace** | **String** | Namespace of the Relationship | [optional] 
 **object** | **String** | Object of the Relationship | [optional] 
 **relation** | **String** | Relation of the Relationship | [optional] 
 **subjectId** | **String** | SubjectID of the Relationship | [optional] 
 **subjectSetNamespace** | **String** | Namespace of the Subject Set | [optional] 
 **subjectSetObject** | **String** | Object of the Subject Set | [optional] 
 **subjectSetRelation** | **String** | Relation of the Subject Set | [optional] 
 **maxDepth** | **Int64** |  | [optional] 

### Return type

[**CheckPermissionResult**](CheckPermissionResult.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkPermissionOrError**
```swift
    open class func checkPermissionOrError(namespace: String? = nil, object: String? = nil, relation: String? = nil, subjectId: String? = nil, subjectSetNamespace: String? = nil, subjectSetObject: String? = nil, subjectSetRelation: String? = nil, maxDepth: Int64? = nil, completion: @escaping (_ data: CheckPermissionResult?, _ error: Error?) -> Void)
```

Check a permission

To learn how relationship tuples and the check works, head over to [the documentation](https://www.ory.sh/docs/keto/concepts/api-overview).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let namespace = "namespace_example" // String | Namespace of the Relationship (optional)
let object = "object_example" // String | Object of the Relationship (optional)
let relation = "relation_example" // String | Relation of the Relationship (optional)
let subjectId = "subjectId_example" // String | SubjectID of the Relationship (optional)
let subjectSetNamespace = "subjectSetNamespace_example" // String | Namespace of the Subject Set (optional)
let subjectSetObject = "subjectSetObject_example" // String | Object of the Subject Set (optional)
let subjectSetRelation = "subjectSetRelation_example" // String | Relation of the Subject Set (optional)
let maxDepth = 987 // Int64 |  (optional)

// Check a permission
PermissionAPI.checkPermissionOrError(namespace: namespace, object: object, relation: relation, subjectId: subjectId, subjectSetNamespace: subjectSetNamespace, subjectSetObject: subjectSetObject, subjectSetRelation: subjectSetRelation, maxDepth: maxDepth) { (response, error) in
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
 **namespace** | **String** | Namespace of the Relationship | [optional] 
 **object** | **String** | Object of the Relationship | [optional] 
 **relation** | **String** | Relation of the Relationship | [optional] 
 **subjectId** | **String** | SubjectID of the Relationship | [optional] 
 **subjectSetNamespace** | **String** | Namespace of the Subject Set | [optional] 
 **subjectSetObject** | **String** | Object of the Subject Set | [optional] 
 **subjectSetRelation** | **String** | Relation of the Subject Set | [optional] 
 **maxDepth** | **Int64** |  | [optional] 

### Return type

[**CheckPermissionResult**](CheckPermissionResult.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expandPermissions**
```swift
    open class func expandPermissions(namespace: String, object: String, relation: String, maxDepth: Int64? = nil, completion: @escaping (_ data: ExpandedPermissionTree?, _ error: Error?) -> Void)
```

Expand a Relationship into permissions.

Use this endpoint to expand a relationship tuple into permissions.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let namespace = "namespace_example" // String | Namespace of the Subject Set
let object = "object_example" // String | Object of the Subject Set
let relation = "relation_example" // String | Relation of the Subject Set
let maxDepth = 987 // Int64 |  (optional)

// Expand a Relationship into permissions.
PermissionAPI.expandPermissions(namespace: namespace, object: object, relation: relation, maxDepth: maxDepth) { (response, error) in
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
 **namespace** | **String** | Namespace of the Subject Set | 
 **object** | **String** | Object of the Subject Set | 
 **relation** | **String** | Relation of the Subject Set | 
 **maxDepth** | **Int64** |  | [optional] 

### Return type

[**ExpandedPermissionTree**](ExpandedPermissionTree.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postCheckPermission**
```swift
    open class func postCheckPermission(maxDepth: Int64? = nil, postCheckPermissionBody: PostCheckPermissionBody? = nil, completion: @escaping (_ data: CheckPermissionResult?, _ error: Error?) -> Void)
```

Check a permission

To learn how relationship tuples and the check works, head over to [the documentation](https://www.ory.sh/docs/keto/concepts/api-overview).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let maxDepth = 987 // Int64 |  (optional)
let postCheckPermissionBody = postCheckPermissionBody(namespace: "namespace_example", object: "object_example", relation: "relation_example", subjectId: "subjectId_example", subjectSet: subjectSet(namespace: "namespace_example", object: "object_example", relation: "relation_example")) // PostCheckPermissionBody |  (optional)

// Check a permission
PermissionAPI.postCheckPermission(maxDepth: maxDepth, postCheckPermissionBody: postCheckPermissionBody) { (response, error) in
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
 **maxDepth** | **Int64** |  | [optional] 
 **postCheckPermissionBody** | [**PostCheckPermissionBody**](PostCheckPermissionBody.md) |  | [optional] 

### Return type

[**CheckPermissionResult**](CheckPermissionResult.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postCheckPermissionOrError**
```swift
    open class func postCheckPermissionOrError(maxDepth: Int64? = nil, postCheckPermissionOrErrorBody: PostCheckPermissionOrErrorBody? = nil, completion: @escaping (_ data: CheckPermissionResult?, _ error: Error?) -> Void)
```

Check a permission

To learn how relationship tuples and the check works, head over to [the documentation](https://www.ory.sh/docs/keto/concepts/api-overview).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let maxDepth = 987 // Int64 |  (optional)
let postCheckPermissionOrErrorBody = postCheckPermissionOrErrorBody(namespace: "namespace_example", object: "object_example", relation: "relation_example", subjectId: "subjectId_example", subjectSet: subjectSet(namespace: "namespace_example", object: "object_example", relation: "relation_example")) // PostCheckPermissionOrErrorBody |  (optional)

// Check a permission
PermissionAPI.postCheckPermissionOrError(maxDepth: maxDepth, postCheckPermissionOrErrorBody: postCheckPermissionOrErrorBody) { (response, error) in
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
 **maxDepth** | **Int64** |  | [optional] 
 **postCheckPermissionOrErrorBody** | [**PostCheckPermissionOrErrorBody**](PostCheckPermissionOrErrorBody.md) |  | [optional] 

### Return type

[**CheckPermissionResult**](CheckPermissionResult.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

