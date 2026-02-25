# WorkspaceAPI

All URIs are relative to *https://playground.projects.oryapis.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createWorkspace**](WorkspaceAPI.md#createworkspace) | **POST** /workspaces | Create a new workspace
[**createWorkspaceApiKey**](WorkspaceAPI.md#createworkspaceapikey) | **POST** /workspaces/{workspace}/tokens | Create workspace API key
[**deleteWorkspaceApiKey**](WorkspaceAPI.md#deleteworkspaceapikey) | **DELETE** /workspaces/{workspace}/tokens/{token_id} | Delete workspace API key
[**getWorkspace**](WorkspaceAPI.md#getworkspace) | **GET** /workspaces/{workspace} | Get a workspace
[**listWorkspaceApiKeys**](WorkspaceAPI.md#listworkspaceapikeys) | **GET** /workspaces/{workspace}/tokens | List a workspace&#39;s API keys
[**listWorkspaceProjects**](WorkspaceAPI.md#listworkspaceprojects) | **GET** /workspaces/{workspace}/projects | List all projects of a workspace
[**listWorkspaces**](WorkspaceAPI.md#listworkspaces) | **GET** /workspaces | List workspaces the user is a member of
[**updateWorkspace**](WorkspaceAPI.md#updateworkspace) | **PUT** /workspaces/{workspace} | Update an workspace


# **createWorkspace**
```swift
    open class func createWorkspace(createWorkspaceBody: CreateWorkspaceBody? = nil, completion: @escaping (_ data: Workspace?, _ error: Error?) -> Void)
```

Create a new workspace

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let createWorkspaceBody = createWorkspaceBody(name: "name_example") // CreateWorkspaceBody |  (optional)

// Create a new workspace
WorkspaceAPI.createWorkspace(createWorkspaceBody: createWorkspaceBody) { (response, error) in
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
 **createWorkspaceBody** | [**CreateWorkspaceBody**](CreateWorkspaceBody.md) |  | [optional] 

### Return type

[**Workspace**](Workspace.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createWorkspaceApiKey**
```swift
    open class func createWorkspaceApiKey(workspace: String, createWorkspaceApiKeyBody: CreateWorkspaceApiKeyBody? = nil, completion: @escaping (_ data: WorkspaceApiKey?, _ error: Error?) -> Void)
```

Create workspace API key

Create an API key for a workspace.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workspace = "workspace_example" // String | The Workspace ID
let createWorkspaceApiKeyBody = CreateWorkspaceApiKeyBody(expiresAt: Date(), name: "name_example") // CreateWorkspaceApiKeyBody |  (optional)

// Create workspace API key
WorkspaceAPI.createWorkspaceApiKey(workspace: workspace, createWorkspaceApiKeyBody: createWorkspaceApiKeyBody) { (response, error) in
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
 **workspace** | **String** | The Workspace ID | 
 **createWorkspaceApiKeyBody** | [**CreateWorkspaceApiKeyBody**](CreateWorkspaceApiKeyBody.md) |  | [optional] 

### Return type

[**WorkspaceApiKey**](WorkspaceApiKey.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteWorkspaceApiKey**
```swift
    open class func deleteWorkspaceApiKey(workspace: String, tokenId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete workspace API key

Deletes an API key and immediately removes it.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workspace = "workspace_example" // String | The Workspace ID or Workspace slug
let tokenId = "tokenId_example" // String | The Token ID

// Delete workspace API key
WorkspaceAPI.deleteWorkspaceApiKey(workspace: workspace, tokenId: tokenId) { (response, error) in
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
 **workspace** | **String** | The Workspace ID or Workspace slug | 
 **tokenId** | **String** | The Token ID | 

### Return type

Void (empty response body)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getWorkspace**
```swift
    open class func getWorkspace(workspace: String, completion: @escaping (_ data: Workspace?, _ error: Error?) -> Void)
```

Get a workspace

Any workspace member can access this endpoint.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workspace = "workspace_example" // String | 

// Get a workspace
WorkspaceAPI.getWorkspace(workspace: workspace) { (response, error) in
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
 **workspace** | **String** |  | 

### Return type

[**Workspace**](Workspace.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listWorkspaceApiKeys**
```swift
    open class func listWorkspaceApiKeys(workspace: String, completion: @escaping (_ data: [WorkspaceApiKey]?, _ error: Error?) -> Void)
```

List a workspace's API keys

A list of all the workspace's API keys.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workspace = "workspace_example" // String | The Workspace ID or Workspace slug

// List a workspace's API keys
WorkspaceAPI.listWorkspaceApiKeys(workspace: workspace) { (response, error) in
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
 **workspace** | **String** | The Workspace ID or Workspace slug | 

### Return type

[**[WorkspaceApiKey]**](WorkspaceApiKey.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listWorkspaceProjects**
```swift
    open class func listWorkspaceProjects(workspace: String, completion: @escaping (_ data: ListWorkspaceProjects?, _ error: Error?) -> Void)
```

List all projects of a workspace

Any workspace member can access this endpoint.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workspace = "workspace_example" // String | 

// List all projects of a workspace
WorkspaceAPI.listWorkspaceProjects(workspace: workspace) { (response, error) in
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
 **workspace** | **String** |  | 

### Return type

[**ListWorkspaceProjects**](ListWorkspaceProjects.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listWorkspaces**
```swift
    open class func listWorkspaces(pageSize: Int64? = nil, pageToken: String? = nil, completion: @escaping (_ data: ListWorkspaces?, _ error: Error?) -> Void)
```

List workspaces the user is a member of

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let pageSize = 987 // Int64 | Items per Page  This is the number of items per page to return. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional) (default to 250)
let pageToken = "pageToken_example" // String | Next Page Token  The next page token. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional)

// List workspaces the user is a member of
WorkspaceAPI.listWorkspaces(pageSize: pageSize, pageToken: pageToken) { (response, error) in
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

### Return type

[**ListWorkspaces**](ListWorkspaces.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateWorkspace**
```swift
    open class func updateWorkspace(workspace: String, updateWorkspaceBody: UpdateWorkspaceBody? = nil, completion: @escaping (_ data: Workspace?, _ error: Error?) -> Void)
```

Update an workspace

Workspace members with the role `OWNER` can access this endpoint.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let workspace = "workspace_example" // String | 
let updateWorkspaceBody = updateWorkspaceBody(name: "name_example") // UpdateWorkspaceBody |  (optional)

// Update an workspace
WorkspaceAPI.updateWorkspace(workspace: workspace, updateWorkspaceBody: updateWorkspaceBody) { (response, error) in
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
 **workspace** | **String** |  | 
 **updateWorkspaceBody** | [**UpdateWorkspaceBody**](UpdateWorkspaceBody.md) |  | [optional] 

### Return type

[**Workspace**](Workspace.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

