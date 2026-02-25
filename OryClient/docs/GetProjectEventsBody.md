# GetProjectEventsBody

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**eventName** | **String** | The event name to query for | [optional] 
**filters** | [AttributeFilter] | Event attribute filters | [optional] 
**from** | **Date** | The start RFC3339 date of the time window | 
**pageSize** | **Int64** | Maximum number of events to return | [optional] [default to 25]
**pageToken** | **String** | Pagination token to fetch next page, empty if first page | [optional] 
**to** | **Date** | The end RFC3339 date of the time window | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


