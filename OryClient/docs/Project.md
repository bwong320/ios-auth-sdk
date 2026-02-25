# Project

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**corsAdmin** | [**ProjectCors**](ProjectCors.md) |  | [optional] 
**corsPublic** | [**ProjectCors**](ProjectCors.md) |  | [optional] 
**environment** | **String** | The environment of the project. prod Production stage Staging dev Development | 
**homeRegion** | **String** | The project home region.  This is used to set where the project data is stored and where the project&#39;s endpoints are located. eu-central EUCentral asia-northeast AsiaNorthEast us-east USEast us-west USWest us US global Global | 
**id** | **String** | The project&#39;s ID. | [readonly] 
**name** | **String** | The name of the project. | 
**organizations** | [BasicOrganization] | The organizations of the project.  Organizations are used to group users and enforce certain restrictions like usage of SSO. | 
**revisionId** | **String** | The configuration revision ID. | [readonly] 
**services** | [**ProjectServices**](ProjectServices.md) |  | 
**slug** | **String** | The project&#39;s slug | [readonly] 
**state** | **String** | The state of the project. running Running halted Halted deleted Deleted | [readonly] 
**workspaceId** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


