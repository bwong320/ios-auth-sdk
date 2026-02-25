# NormalizedProjectRevisionCourierChannel

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**channelId** | **String** | The Channel&#39;s public ID | 
**createdAt** | **Date** | The creation date | [optional] [readonly] 
**requestConfigAuthConfigApiKeyIn** | **String** | API key location  Can either be \&quot;header\&quot; or \&quot;query\&quot; | [optional] 
**requestConfigAuthConfigApiKeyName** | **String** | API key name  Only used if the auth type is api_key | [optional] 
**requestConfigAuthConfigApiKeyValue** | **String** | API key value  Only used if the auth type is api_key | [optional] 
**requestConfigAuthConfigBasicAuthPassword** | **String** | Basic Auth Password  Only used if the auth type is basic_auth | [optional] 
**requestConfigAuthConfigBasicAuthUser** | **String** | Basic Auth Username  Only used if the auth type is basic_auth | [optional] 
**requestConfigAuthType** | **String** | HTTP Auth Method to use for the HTTP call  Can either be basic_auth or api_key basic_auth CourierChannelAuthTypeBasicAuth api_key CourierChannelAuthTypeApiKey | [optional] 
**requestConfigBody** | **String** | URI pointing to the JsonNet template used for HTTP body payload generation. | 
**requestConfigHeaders** | **JSONValue** | NullJSONRawMessage represents a json.RawMessage that works well with JSON, SQL, and Swagger and is NULLable- | [optional] 
**requestConfigMethod** | **String** | The HTTP method to use (GET, POST, etc) for the HTTP call | 
**requestConfigUrl** | **String** |  | [optional] 
**updatedAt** | **Date** | Last upate time | [optional] [readonly] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


