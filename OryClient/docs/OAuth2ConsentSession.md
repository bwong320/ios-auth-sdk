# OAuth2ConsentSession

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**consentRequest** | [**OAuth2ConsentRequest**](OAuth2ConsentRequest.md) |  | [optional] 
**consentRequestId** | **String** | ConsentRequestID is the identifier of the consent request that initiated this consent session. | [optional] 
**context** | **JSONValue** |  | [optional] 
**grantAccessTokenAudience** | **[String]** |  | [optional] 
**grantScope** | **[String]** |  | [optional] 
**handledAt** | **Date** |  | [optional] 
**remember** | **Bool** | Remember Consent  Remember, if set to true, tells ORY Hydra to remember this consent authorization and reuse it if the same client asks the same user for the same, or a subset of, scope. | [optional] 
**rememberFor** | **Int64** | Remember Consent For  RememberFor sets how long the consent authorization should be remembered for in seconds. If set to &#x60;0&#x60;, the authorization will be remembered indefinitely. | [optional] 
**session** | [**AcceptOAuth2ConsentRequestSession**](AcceptOAuth2ConsentRequestSession.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


