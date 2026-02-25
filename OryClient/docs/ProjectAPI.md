# ProjectAPI

All URIs are relative to *https://playground.projects.oryapis.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrganization**](ProjectAPI.md#createorganization) | **POST** /projects/{project_id}/organizations | Create an Enterprise SSO Organization
[**createOrganizationOnboardingPortalLink**](ProjectAPI.md#createorganizationonboardingportallink) | **POST** /projects/{project_id}/organizations/{organization_id}/onboarding-portal-links | Create organization onboarding portal link
[**createProject**](ProjectAPI.md#createproject) | **POST** /projects | Create a Project
[**createProjectApiKey**](ProjectAPI.md#createprojectapikey) | **POST** /projects/{project}/tokens | Create project API key
[**deleteOrganization**](ProjectAPI.md#deleteorganization) | **DELETE** /projects/{project_id}/organizations/{organization_id} | Delete Enterprise SSO Organization
[**deleteOrganizationOnboardingPortalLink**](ProjectAPI.md#deleteorganizationonboardingportallink) | **DELETE** /projects/{project_id}/organizations/{organization_id}/onboarding-portal-links/{onboarding_portal_link_id} | Delete an organization onboarding portal link
[**deleteProjectApiKey**](ProjectAPI.md#deleteprojectapikey) | **DELETE** /projects/{project}/tokens/{token_id} | Delete project API key
[**getOrganization**](ProjectAPI.md#getorganization) | **GET** /projects/{project_id}/organizations/{organization_id} | Get Enterprise SSO Organization by ID
[**getOrganizationOnboardingPortalLinks**](ProjectAPI.md#getorganizationonboardingportallinks) | **GET** /projects/{project_id}/organizations/{organization_id}/onboarding-portal-links | Get the organization onboarding portal links
[**getProject**](ProjectAPI.md#getproject) | **GET** /projects/{project_id} | Get a Project
[**getProjectMembers**](ProjectAPI.md#getprojectmembers) | **GET** /projects/{project}/members | Get all members associated with this project
[**listOrganizations**](ProjectAPI.md#listorganizations) | **GET** /projects/{project_id}/organizations | List all Enterprise SSO organizations
[**listProjectApiKeys**](ProjectAPI.md#listprojectapikeys) | **GET** /projects/{project}/tokens | List a project&#39;s API keys
[**listProjects**](ProjectAPI.md#listprojects) | **GET** /projects | List All Projects
[**patchProject**](ProjectAPI.md#patchproject) | **PATCH** /projects/{project_id} | Patch an Ory Network Project Configuration
[**patchProjectWithRevision**](ProjectAPI.md#patchprojectwithrevision) | **PATCH** /projects/{project_id}/revision/{revision_id} | Patch an Ory Network Project Configuration based on a revision ID
[**purgeProject**](ProjectAPI.md#purgeproject) | **DELETE** /projects/{project_id} | Irrecoverably purge a project
[**removeProjectMember**](ProjectAPI.md#removeprojectmember) | **DELETE** /projects/{project}/members/{member} | Remove a member associated with this project
[**setProject**](ProjectAPI.md#setproject) | **PUT** /projects/{project_id} | Update an Ory Network Project Configuration
[**updateOrganization**](ProjectAPI.md#updateorganization) | **PUT** /projects/{project_id}/organizations/{organization_id} | Update an Enterprise SSO Organization
[**updateOrganizationOnboardingPortalLink**](ProjectAPI.md#updateorganizationonboardingportallink) | **POST** /projects/{project_id}/organizations/{organization_id}/onboarding-portal-links/{onboarding_portal_link_id} | Update organization onboarding portal link


# **createOrganization**
```swift
    open class func createOrganization(projectId: String, organizationBody: OrganizationBody? = nil, completion: @escaping (_ data: Organization?, _ error: Error?) -> Void)
```

Create an Enterprise SSO Organization

Deprecated: use setProject or patchProjectWithRevision instead  Creates an Enterprise SSO Organization in a project.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let organizationBody = OrganizationBody(domains: ["domains_example"], label: "label_example") // OrganizationBody |  (optional)

// Create an Enterprise SSO Organization
ProjectAPI.createOrganization(projectId: projectId, organizationBody: organizationBody) { (response, error) in
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
 **organizationBody** | [**OrganizationBody**](OrganizationBody.md) |  | [optional] 

### Return type

[**Organization**](Organization.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrganizationOnboardingPortalLink**
```swift
    open class func createOrganizationOnboardingPortalLink(projectId: String, organizationId: String, createOrganizationOnboardingPortalLinkBody: CreateOrganizationOnboardingPortalLinkBody? = nil, completion: @escaping (_ data: OnboardingPortalLink?, _ error: Error?) -> Void)
```

Create organization onboarding portal link

Create a onboarding portal link for an organization.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let organizationId = "organizationId_example" // String | Organization ID  The Organization's ID.
let createOrganizationOnboardingPortalLinkBody = createOrganizationOnboardingPortalLinkBody(appleMapperUrl: "appleMapperUrl_example", auth0MapperUrl: "auth0MapperUrl_example", customHostnameId: "customHostnameId_example", enableScim: false, enableSso: false, expiresAt: Date(), facebookMapperUrl: "facebookMapperUrl_example", genericOidcMapperUrl: "genericOidcMapperUrl_example", githubMapperUrl: "githubMapperUrl_example", gitlabMapperUrl: "gitlabMapperUrl_example", googleMapperUrl: "googleMapperUrl_example", microsoftMapperUrl: "microsoftMapperUrl_example", netidMapperUrl: "netidMapperUrl_example", proxyAcsUrl: "proxyAcsUrl_example", proxyOidcRedirectUrl: "proxyOidcRedirectUrl_example", proxySamlAudienceOverride: "proxySamlAudienceOverride_example", proxyScimServerUrl: "proxyScimServerUrl_example", samlMapperUrl: "samlMapperUrl_example", scimMapperUrl: "scimMapperUrl_example") // CreateOrganizationOnboardingPortalLinkBody |  (optional)

// Create organization onboarding portal link
ProjectAPI.createOrganizationOnboardingPortalLink(projectId: projectId, organizationId: organizationId, createOrganizationOnboardingPortalLinkBody: createOrganizationOnboardingPortalLinkBody) { (response, error) in
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
 **organizationId** | **String** | Organization ID  The Organization&#39;s ID. | 
 **createOrganizationOnboardingPortalLinkBody** | [**CreateOrganizationOnboardingPortalLinkBody**](CreateOrganizationOnboardingPortalLinkBody.md) |  | [optional] 

### Return type

[**OnboardingPortalLink**](OnboardingPortalLink.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createProject**
```swift
    open class func createProject(createProjectBody: CreateProjectBody? = nil, completion: @escaping (_ data: Project?, _ error: Error?) -> Void)
```

Create a Project

Creates a new project.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let createProjectBody = createProjectBody(environment: "environment_example", homeRegion: "homeRegion_example", name: "name_example", workspaceId: "workspaceId_example") // CreateProjectBody |  (optional)

// Create a Project
ProjectAPI.createProject(createProjectBody: createProjectBody) { (response, error) in
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
 **createProjectBody** | [**CreateProjectBody**](CreateProjectBody.md) |  | [optional] 

### Return type

[**Project**](Project.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createProjectApiKey**
```swift
    open class func createProjectApiKey(project: String, createProjectApiKeyRequest: CreateProjectApiKeyRequest? = nil, completion: @escaping (_ data: ProjectApiKey?, _ error: Error?) -> Void)
```

Create project API key

Create an API key for a project.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let project = "project_example" // String | The Project ID or Project slug
let createProjectApiKeyRequest = createProjectApiKey_request(expiresAt: Date(), name: "name_example") // CreateProjectApiKeyRequest |  (optional)

// Create project API key
ProjectAPI.createProjectApiKey(project: project, createProjectApiKeyRequest: createProjectApiKeyRequest) { (response, error) in
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
 **project** | **String** | The Project ID or Project slug | 
 **createProjectApiKeyRequest** | [**CreateProjectApiKeyRequest**](CreateProjectApiKeyRequest.md) |  | [optional] 

### Return type

[**ProjectApiKey**](ProjectApiKey.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganization**
```swift
    open class func deleteOrganization(projectId: String, organizationId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete Enterprise SSO Organization

Deprecated: use setProject or patchProjectWithRevision instead  Irrecoverably deletes an Enterprise SSO Organization in a project by its ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let organizationId = "organizationId_example" // String | Organization ID  The Organization's ID.

// Delete Enterprise SSO Organization
ProjectAPI.deleteOrganization(projectId: projectId, organizationId: organizationId) { (response, error) in
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
 **organizationId** | **String** | Organization ID  The Organization&#39;s ID. | 

### Return type

Void (empty response body)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganizationOnboardingPortalLink**
```swift
    open class func deleteOrganizationOnboardingPortalLink(projectId: String, organizationId: String, onboardingPortalLinkId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete an organization onboarding portal link

Deletes a onboarding portal link for an organization.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | 
let organizationId = "organizationId_example" // String | 
let onboardingPortalLinkId = "onboardingPortalLinkId_example" // String | 

// Delete an organization onboarding portal link
ProjectAPI.deleteOrganizationOnboardingPortalLink(projectId: projectId, organizationId: organizationId, onboardingPortalLinkId: onboardingPortalLinkId) { (response, error) in
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
 **projectId** | **String** |  | 
 **organizationId** | **String** |  | 
 **onboardingPortalLinkId** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteProjectApiKey**
```swift
    open class func deleteProjectApiKey(project: String, tokenId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete project API key

Deletes an API key and immediately removes it.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let project = "project_example" // String | The Project ID or Project slug
let tokenId = "tokenId_example" // String | The Token ID

// Delete project API key
ProjectAPI.deleteProjectApiKey(project: project, tokenId: tokenId) { (response, error) in
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
 **project** | **String** | The Project ID or Project slug | 
 **tokenId** | **String** | The Token ID | 

### Return type

Void (empty response body)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganization**
```swift
    open class func getOrganization(projectId: String, organizationId: String, completion: @escaping (_ data: GetOrganizationResponse?, _ error: Error?) -> Void)
```

Get Enterprise SSO Organization by ID

Deprecated: use getProject instead  Retrieves an Enterprise SSO Organization for a project by its ID

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let organizationId = "organizationId_example" // String | Organization ID  The Organization's ID.

// Get Enterprise SSO Organization by ID
ProjectAPI.getOrganization(projectId: projectId, organizationId: organizationId) { (response, error) in
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
 **organizationId** | **String** | Organization ID  The Organization&#39;s ID. | 

### Return type

[**GetOrganizationResponse**](GetOrganizationResponse.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganizationOnboardingPortalLinks**
```swift
    open class func getOrganizationOnboardingPortalLinks(projectId: String, organizationId: String, completion: @escaping (_ data: OrganizationOnboardingPortalLinksResponse?, _ error: Error?) -> Void)
```

Get the organization onboarding portal links

Retrieves the organization onboarding portal links.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let organizationId = "organizationId_example" // String | Organization ID  The Organization's ID.

// Get the organization onboarding portal links
ProjectAPI.getOrganizationOnboardingPortalLinks(projectId: projectId, organizationId: organizationId) { (response, error) in
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
 **organizationId** | **String** | Organization ID  The Organization&#39;s ID. | 

### Return type

[**OrganizationOnboardingPortalLinksResponse**](OrganizationOnboardingPortalLinksResponse.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProject**
```swift
    open class func getProject(projectId: String, completion: @escaping (_ data: Project?, _ error: Error?) -> Void)
```

Get a Project

Get a project you have access to by its ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.

// Get a Project
ProjectAPI.getProject(projectId: projectId) { (response, error) in
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

[**Project**](Project.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getProjectMembers**
```swift
    open class func getProjectMembers(project: String, completion: @escaping (_ data: [ProjectMember]?, _ error: Error?) -> Void)
```

Get all members associated with this project

This endpoint requires the user to be a member of the project with the role `OWNER` or `DEVELOPER`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let project = "project_example" // String | 

// Get all members associated with this project
ProjectAPI.getProjectMembers(project: project) { (response, error) in
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
 **project** | **String** |  | 

### Return type

[**[ProjectMember]**](ProjectMember.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listOrganizations**
```swift
    open class func listOrganizations(projectId: String, pageSize: Int64? = nil, pageToken: String? = nil, domain: String? = nil, completion: @escaping (_ data: ListOrganizationsResponse?, _ error: Error?) -> Void)
```

List all Enterprise SSO organizations

Deprecated: use getProject instead  Lists all Enterprise SSO organizations in a project.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let pageSize = 987 // Int64 | Items per Page  This is the number of items per page to return. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional) (default to 250)
let pageToken = "pageToken_example" // String | Next Page Token  The next page token. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). (optional)
let domain = "domain_example" // String | Domain  If set, only organizations with that domain will be returned. (optional)

// List all Enterprise SSO organizations
ProjectAPI.listOrganizations(projectId: projectId, pageSize: pageSize, pageToken: pageToken, domain: domain) { (response, error) in
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
 **pageSize** | **Int64** | Items per Page  This is the number of items per page to return. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). | [optional] [default to 250]
 **pageToken** | **String** | Next Page Token  The next page token. For details on pagination please head over to the [pagination documentation](https://www.ory.sh/docs/ecosystem/api-design#pagination). | [optional] 
 **domain** | **String** | Domain  If set, only organizations with that domain will be returned. | [optional] 

### Return type

[**ListOrganizationsResponse**](ListOrganizationsResponse.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjectApiKeys**
```swift
    open class func listProjectApiKeys(project: String, completion: @escaping (_ data: [ProjectApiKey]?, _ error: Error?) -> Void)
```

List a project's API keys

A list of all the project's API keys.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let project = "project_example" // String | The Project ID or Project slug

// List a project's API keys
ProjectAPI.listProjectApiKeys(project: project) { (response, error) in
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
 **project** | **String** | The Project ID or Project slug | 

### Return type

[**[ProjectApiKey]**](ProjectApiKey.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listProjects**
```swift
    open class func listProjects(completion: @escaping (_ data: [ProjectMetadata]?, _ error: Error?) -> Void)
```

List All Projects

Lists all projects you have access to.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient


// List All Projects
ProjectAPI.listProjects() { (response, error) in
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

[**[ProjectMetadata]**](ProjectMetadata.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchProject**
```swift
    open class func patchProject(projectId: String, jsonPatch: [JsonPatch]? = nil, completion: @escaping (_ data: SuccessfulProjectUpdate?, _ error: Error?) -> Void)
```

Patch an Ory Network Project Configuration

Deprecated: Use the `patchProjectWithRevision` endpoint instead to specify the exact revision the patch was generated for.  This endpoints allows you to patch individual Ory Network project configuration keys for Ory's services (identity, permission, ...). The configuration format is fully compatible with the open source projects for the respective services (e.g. Ory Kratos for Identity, Ory Keto for Permissions).  This endpoint expects the `version` key to be set in the payload. If it is unset, it will try to import the config as if it is from the most recent version.  If you have an older version of a configuration, you should set the version key in the payload!  While this endpoint is able to process all configuration items related to features (e.g. password reset), it does not support operational configuration items (e.g. port, tracing, logging) otherwise available in the open source.  For configuration items that can not be translated to the Ory Network, this endpoint will return a list of warnings to help you understand which parts of your config could not be processed.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let jsonPatch = [jsonPatch(from: "from_example", op: "op_example", path: "path_example", value: 123)] // [JsonPatch] |  (optional)

// Patch an Ory Network Project Configuration
ProjectAPI.patchProject(projectId: projectId, jsonPatch: jsonPatch) { (response, error) in
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
 **jsonPatch** | [**[JsonPatch]**](JsonPatch.md) |  | [optional] 

### Return type

[**SuccessfulProjectUpdate**](SuccessfulProjectUpdate.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchProjectWithRevision**
```swift
    open class func patchProjectWithRevision(projectId: String, revisionId: String, jsonPatch: [JsonPatch]? = nil, completion: @escaping (_ data: SuccessfulProjectUpdate?, _ error: Error?) -> Void)
```

Patch an Ory Network Project Configuration based on a revision ID

This endpoints allows you to patch individual Ory Network Project configuration keys for Ory's services (identity, permission, ...). The configuration format is fully compatible with the open source projects for the respective services (e.g. Ory Kratos for Identity, Ory Keto for Permissions).  This endpoint expects the `version` key to be set in the payload. If it is unset, it will try to import the config as if it is from the most recent version.  If you have an older version of a configuration, you should set the version key in the payload!  While this endpoint is able to process all configuration items related to features (e.g. password reset), it does not support operational configuration items (e.g. port, tracing, logging) otherwise available in the open source.  For configuration items that can not be translated to the Ory Network, this endpoint will return a list of warnings to help you understand which parts of your config could not be processed.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let revisionId = "revisionId_example" // String | Revision ID  The revision ID that this patch was generated for.
let jsonPatch = [jsonPatch(from: "from_example", op: "op_example", path: "path_example", value: 123)] // [JsonPatch] |  (optional)

// Patch an Ory Network Project Configuration based on a revision ID
ProjectAPI.patchProjectWithRevision(projectId: projectId, revisionId: revisionId, jsonPatch: jsonPatch) { (response, error) in
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
 **revisionId** | **String** | Revision ID  The revision ID that this patch was generated for. | 
 **jsonPatch** | [**[JsonPatch]**](JsonPatch.md) |  | [optional] 

### Return type

[**SuccessfulProjectUpdate**](SuccessfulProjectUpdate.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **purgeProject**
```swift
    open class func purgeProject(projectId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Irrecoverably purge a project

!! Use with extreme caution !!  Using this API endpoint you can purge (completely delete) a project and its data. This action can not be undone and will delete ALL your data.  Calling this endpoint will additionally delete custom domains and other related data.  If the project is linked to a subscription, the subscription needs to be unlinked first.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.

// Irrecoverably purge a project
ProjectAPI.purgeProject(projectId: projectId) { (response, error) in
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

Void (empty response body)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeProjectMember**
```swift
    open class func removeProjectMember(project: String, member: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove a member associated with this project

This also sets their invite status to `REMOVED`. This endpoint requires the user to be a member of the project with the role `OWNER`.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let project = "project_example" // String | 
let member = "member_example" // String | 

// Remove a member associated with this project
ProjectAPI.removeProjectMember(project: project, member: member) { (response, error) in
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
 **project** | **String** |  | 
 **member** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setProject**
```swift
    open class func setProject(projectId: String, setProject: SetProject? = nil, completion: @escaping (_ data: SuccessfulProjectUpdate?, _ error: Error?) -> Void)
```

Update an Ory Network Project Configuration

This endpoints allows you to update the Ory Network project configuration for individual services (identity, permission, ...). The configuration is fully compatible with the open source projects for the respective services (e.g. Ory Kratos for Identity, Ory Keto for Permissions).  This endpoint expects the `version` key to be set in the payload. If it is unset, it will try to import the config as if it is from the most recent version.  If you have an older version of a configuration, you should set the version key in the payload!  While this endpoint is able to process all configuration items related to features (e.g. password reset), it does not support operational configuration items (e.g. port, tracing, logging) otherwise available in the open source.  For configuration items that can not be translated to the Ory Network, this endpoint will return a list of warnings to help you understand which parts of your config could not be processed.  Be aware that updating any service's configuration will completely override your current configuration for that service!

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let setProject = setProject(corsAdmin: projectCors(enabled: false, origins: ["origins_example"]), corsPublic: nil, name: "name_example", organizations: [basicOrganization(domains: ["domains_example"], id: "id_example", label: "label_example")], services: projectServices(accountExperience: projectServiceAccountExperience(config: 123), identity: projectServiceIdentity(config: 123), oauth2: projectServiceOAuth2(config: 123), permission: projectServicePermission(config: 123))) // SetProject |  (optional)

// Update an Ory Network Project Configuration
ProjectAPI.setProject(projectId: projectId, setProject: setProject) { (response, error) in
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
 **setProject** | [**SetProject**](SetProject.md) |  | [optional] 

### Return type

[**SuccessfulProjectUpdate**](SuccessfulProjectUpdate.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganization**
```swift
    open class func updateOrganization(projectId: String, organizationId: String, organizationBody: OrganizationBody? = nil, completion: @escaping (_ data: Organization?, _ error: Error?) -> Void)
```

Update an Enterprise SSO Organization

Deprecated: use setProject or patchProjectWithRevision instead  Updates an Enterprise SSO Organization in a project by its ID.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let organizationId = "organizationId_example" // String | Organization ID  The Organization's ID.
let organizationBody = OrganizationBody(domains: ["domains_example"], label: "label_example") // OrganizationBody |  (optional)

// Update an Enterprise SSO Organization
ProjectAPI.updateOrganization(projectId: projectId, organizationId: organizationId, organizationBody: organizationBody) { (response, error) in
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
 **organizationId** | **String** | Organization ID  The Organization&#39;s ID. | 
 **organizationBody** | [**OrganizationBody**](OrganizationBody.md) |  | [optional] 

### Return type

[**Organization**](Organization.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganizationOnboardingPortalLink**
```swift
    open class func updateOrganizationOnboardingPortalLink(projectId: String, organizationId: String, onboardingPortalLinkId: String, updateOrganizationOnboardingPortalLinkBody: UpdateOrganizationOnboardingPortalLinkBody? = nil, completion: @escaping (_ data: OnboardingPortalLink?, _ error: Error?) -> Void)
```

Update organization onboarding portal link

Update a onboarding portal link for an organization.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let projectId = "projectId_example" // String | Project ID  The project's ID.
let organizationId = "organizationId_example" // String | Organization ID  The Organization's ID.
let onboardingPortalLinkId = "onboardingPortalLinkId_example" // String | 
let updateOrganizationOnboardingPortalLinkBody = updateOrganizationOnboardingPortalLinkBody(enableScim: false, enableSso: false, expiresAt: Date()) // UpdateOrganizationOnboardingPortalLinkBody |  (optional)

// Update organization onboarding portal link
ProjectAPI.updateOrganizationOnboardingPortalLink(projectId: projectId, organizationId: organizationId, onboardingPortalLinkId: onboardingPortalLinkId, updateOrganizationOnboardingPortalLinkBody: updateOrganizationOnboardingPortalLinkBody) { (response, error) in
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
 **organizationId** | **String** | Organization ID  The Organization&#39;s ID. | 
 **onboardingPortalLinkId** | **String** |  | 
 **updateOrganizationOnboardingPortalLinkBody** | [**UpdateOrganizationOnboardingPortalLinkBody**](UpdateOrganizationOnboardingPortalLinkBody.md) |  | [optional] 

### Return type

[**OnboardingPortalLink**](OnboardingPortalLink.md)

### Authorization

[oryWorkspaceApiKey](../README.md#oryWorkspaceApiKey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

