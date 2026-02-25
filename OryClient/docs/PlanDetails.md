# PlanDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**baseFeeMonthly** | **Int64** | BaseFeeMonthly is the monthly base fee for the plan. | 
**baseFeeYearly** | **Int64** | BaseFeeYearly is the yearly base fee for the plan. | 
**custom** | **Bool** | Custom is true if the plan is custom. This means it will be hidden from the pricing page. | 
**description** | **String** | Description is the description of the plan. | 
**developmentFeatures** | [String: GenericUsage] |  | 
**features** | [String: GenericUsage] |  | 
**latest** | **Bool** | Latest is true if the plan is the latest version of a plan and should be available for self-service usage. | [optional] 
**name** | **String** | Name is the name of the plan. | 
**productionFeatures** | [String: GenericUsage] |  | 
**stagingFeatures** | [String: GenericUsage] |  | 
**version** | **Int64** | Version is the version of the plan. The combination of &#x60;name@version&#x60; must be unique. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


