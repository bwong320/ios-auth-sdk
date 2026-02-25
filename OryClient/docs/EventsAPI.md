# EventsAPI

All URIs are relative to *https://playground.projects.oryapis.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createEventStream**](EventsAPI.md#createeventstream) | **POST** /projects/{project_id}/eventstreams | Create an event stream for your project.
[**deleteEventStream**](EventsAPI.md#deleteeventstream) | **DELETE** /projects/{project_id}/eventstreams/{event_stream_id} | Remove an event stream from a project
[**listEventStreams**](EventsAPI.md#listeventstreams) | **GET** /projects/{project_id}/eventstreams | List all event streams for the project. This endpoint is not paginated.
[**setEventStream**](EventsAPI.md#seteventstream) | **PUT** /projects/{project_id}/eventstreams/{event_stream_id} | Update an event stream for a project.


# **createEventStream**
```swift
    open class func createEventStream(projectId: String, createEventStreamBody: CreateEventStreamBody, completion: @escaping (_ data: EventStream?, _ error: Error?) -> Void)
```

Create an event stream for your project.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let createEventStreamBody = createEventStreamBody(roleArn: "roleArn_example", topicArn: "topicArn_example", type: "type_example") // CreateEventStreamBody | 

// Create an event stream for your project.
EventsAPI.createEventStream(projectId: projectId, createEventStreamBody: createEventStreamBody) { (response, error) in
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
 **projectId** | **String** | Project ID  The project&#39;s ID. | 
 **createEventStreamBody** | [**CreateEventStreamBody**](CreateEventStreamBody.md) |  | 

### Return type

[**EventStream**](EventStream.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteEventStream**
```swift
    open class func deleteEventStream(projectId: String, eventStreamId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove an event stream from a project

Remove an event stream from a project.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let eventStreamId = "eventStreamId_example" // String | Event Stream ID  The ID of the event stream to be deleted, as returned when created.

// Remove an event stream from a project
EventsAPI.deleteEventStream(projectId: projectId, eventStreamId: eventStreamId) { (response, error) in
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
 **projectId** | **String** | Project ID  The project&#39;s ID. | 
 **eventStreamId** | **String** | Event Stream ID  The ID of the event stream to be deleted, as returned when created. | 

### Return type

Void (empty response body)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listEventStreams**
```swift
    open class func listEventStreams(projectId: String, completion: @escaping (_ data: ListEventStreams?, _ error: Error?) -> Void)
```

List all event streams for the project. This endpoint is not paginated.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.

// List all event streams for the project. This endpoint is not paginated.
EventsAPI.listEventStreams(projectId: projectId) { (response, error) in
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
 **projectId** | **String** | Project ID  The project&#39;s ID. | 

### Return type

[**ListEventStreams**](ListEventStreams.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setEventStream**
```swift
    open class func setEventStream(projectId: String, eventStreamId: String, setEventStreamBody: SetEventStreamBody? = nil, completion: @escaping (_ data: EventStream?, _ error: Error?) -> Void)
```

Update an event stream for a project.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let eventStreamId = "eventStreamId_example" // String | Event Stream ID  The event stream's ID.
let setEventStreamBody = setEventStreamBody(roleArn: "roleArn_example", topicArn: "topicArn_example", type: "type_example") // SetEventStreamBody |  (optional)

// Update an event stream for a project.
EventsAPI.setEventStream(projectId: projectId, eventStreamId: eventStreamId, setEventStreamBody: setEventStreamBody) { (response, error) in
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
 **projectId** | **String** | Project ID  The project&#39;s ID. | 
 **eventStreamId** | **String** | Event Stream ID  The event stream&#39;s ID. | 
 **setEventStreamBody** | [**SetEventStreamBody**](SetEventStreamBody.md) |  | [optional] 

### Return type

[**EventStream**](EventStream.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

