# RelationshipAPI

All URIs are relative to *https://playground.projects.oryapis.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**checkOplSyntax**](RelationshipAPI.md#checkoplsyntax) | **POST** /opl/syntax/check | Check the syntax of an OPL file
[**createRelationship**](RelationshipAPI.md#createrelationship) | **PUT** /admin/relation-tuples | Create a Relationship
[**deleteRelationships**](RelationshipAPI.md#deleterelationships) | **DELETE** /admin/relation-tuples | Delete Relationships
[**getRelationships**](RelationshipAPI.md#getrelationships) | **GET** /relation-tuples | Query relationships
[**listRelationshipNamespaces**](RelationshipAPI.md#listrelationshipnamespaces) | **GET** /namespaces | Query namespaces
[**patchRelationships**](RelationshipAPI.md#patchrelationships) | **PATCH** /admin/relation-tuples | Patch Multiple Relationships


# **checkOplSyntax**
```swift
    open class func checkOplSyntax(body: String? = nil, completion: @escaping (_ data: CheckOplSyntaxResult?, _ error: Error?) -> Void)
```

Check the syntax of an OPL file

The OPL file is expected in the body of the request.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let body = "body_example" // String |  (optional)

// Check the syntax of an OPL file
RelationshipAPI.checkOplSyntax(body: body) { (response, error) in
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
 **body** | **String** |  | [optional] 

### Return type

[**CheckOplSyntaxResult**](CheckOplSyntaxResult.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: text/plain
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createRelationship**
```swift
    open class func createRelationship(createRelationshipBody: CreateRelationshipBody? = nil, completion: @escaping (_ data: Relationship?, _ error: Error?) -> Void)
```

Create a Relationship

Use this endpoint to create a relationship.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let createRelationshipBody = createRelationshipBody(namespace: "namespace_example", object: "object_example", relation: "relation_example", subjectId: "subjectId_example", subjectSet: subjectSet(namespace: "namespace_example", object: "object_example", relation: "relation_example")) // CreateRelationshipBody |  (optional)

// Create a Relationship
RelationshipAPI.createRelationship(createRelationshipBody: createRelationshipBody) { (response, error) in
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
 **createRelationshipBody** | [**CreateRelationshipBody**](CreateRelationshipBody.md) |  | [optional] 

### Return type

[**Relationship**](Relationship.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteRelationships**
```swift
    open class func deleteRelationships(namespace: String? = nil, object: String? = nil, relation: String? = nil, subjectId: String? = nil, subjectSetNamespace: String? = nil, subjectSetObject: String? = nil, subjectSetRelation: String? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Relationships

Use this endpoint to delete relationships

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

// Delete Relationships
RelationshipAPI.deleteRelationships(namespace: namespace, object: object, relation: relation, subjectId: subjectId, subjectSetNamespace: subjectSetNamespace, subjectSetObject: subjectSetObject, subjectSetRelation: subjectSetRelation) { (response, error) in
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

### Return type

Void (empty response body)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRelationships**
```swift
    open class func getRelationships(pageSize: Int64? = nil, pageToken: String? = nil, namespace: String? = nil, object: String? = nil, relation: String? = nil, subjectId: String? = nil, subjectSetNamespace: String? = nil, subjectSetObject: String? = nil, subjectSetRelation: String? = nil, completion: @escaping (_ data: Relationships?, _ error: Error?) -> Void)
```

Query relationships

Get all relationships that match the query. Only the namespace field is required.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let pageSize = 987 // Int64 | Items per Page  This is the number of items per page to return. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional) (default to 250)
let pageToken = "pageToken_example" // String | Next Page Token  The next page token. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional)
let namespace = "namespace_example" // String | Namespace of the Relationship (optional)
let object = "object_example" // String | Object of the Relationship (optional)
let relation = "relation_example" // String | Relation of the Relationship (optional)
let subjectId = "subjectId_example" // String | SubjectID of the Relationship (optional)
let subjectSetNamespace = "subjectSetNamespace_example" // String | Namespace of the Subject Set (optional)
let subjectSetObject = "subjectSetObject_example" // String | Object of the Subject Set (optional)
let subjectSetRelation = "subjectSetRelation_example" // String | Relation of the Subject Set (optional)

// Query relationships
RelationshipAPI.getRelationships(pageSize: pageSize, pageToken: pageToken, namespace: namespace, object: object, relation: relation, subjectId: subjectId, subjectSetNamespace: subjectSetNamespace, subjectSetObject: subjectSetObject, subjectSetRelation: subjectSetRelation) { (response, error) in
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
 **namespace** | **String** | Namespace of the Relationship | [optional] 
 **object** | **String** | Object of the Relationship | [optional] 
 **relation** | **String** | Relation of the Relationship | [optional] 
 **subjectId** | **String** | SubjectID of the Relationship | [optional] 
 **subjectSetNamespace** | **String** | Namespace of the Subject Set | [optional] 
 **subjectSetObject** | **String** | Object of the Subject Set | [optional] 
 **subjectSetRelation** | **String** | Relation of the Subject Set | [optional] 

### Return type

[**Relationships**](Relationships.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listRelationshipNamespaces**
```swift
    open class func listRelationshipNamespaces(completion: @escaping (_ data: RelationshipNamespaces?, _ error: Error?) -> Void)
```

Query namespaces

Get all namespaces

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// Query namespaces
RelationshipAPI.listRelationshipNamespaces() { (response, error) in
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

[**RelationshipNamespaces**](RelationshipNamespaces.md)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchRelationships**
```swift
    open class func patchRelationships(relationshipPatch: [RelationshipPatch]? = nil, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Patch Multiple Relationships

Use this endpoint to patch one or more relationships.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let relationshipPatch = [relationshipPatch(action: "action_example", relationTuple: relationship(namespace: "namespace_example", object: "object_example", relation: "relation_example", subjectId: "subjectId_example", subjectSet: subjectSet(namespace: "namespace_example", object: "object_example", relation: "relation_example")))] // [RelationshipPatch] |  (optional)

// Patch Multiple Relationships
RelationshipAPI.patchRelationships(relationshipPatch: relationshipPatch) { (response, error) in
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
 **relationshipPatch** | [**[RelationshipPatch]**](RelationshipPatch.md) |  | [optional] 

### Return type

Void (empty response body)

### Authorization

[oryAccessToken](../README.md#oryAccessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

