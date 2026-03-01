# iOS Authentication SDK for Ory Network

This is a Swift SDK that wraps the generated Swift SDK for Ory Network Kratos which supports username+password login. The SDK parses dynamic UI nodes from Ory into SwiftUI-friendly models, stores a session token securely in the iOS Keychain, and provides a typed error model.

## Public SDK API

```swift
public protocol OryAuthClientProtocol {
    func initLoginFlow() async throws -> OryLoginFlow
    func submitLogin(flowId: String, credentials: LoginCredentials) async throws -> OrySession
    func getSession() async throws -> OrySession
    func logout() async throws
}
```

## Integration Example

```swift
import OryAuthSDK
import OryClient

// Configure OryAuthClient
// projectBaseURL is taken from Ory Console -> Project Settings, user should copy 'API endpoints' to use as projectBaseURL
let projectBaseURL = "https://your-project.projects.oryapis.com"
let oryClient = OryAuthClient(projectBaseURL: projectBaseURL)

// Initialize login flow to get OryLoginFlow
// Should be done in viewModel and store fields to render UI
let loginFlow = try await client.initLoginFlow()
self.fields = loginFlow.fields

// Check if fields contain passkey, if so get passkey challenge from loginFlow
if self.fields.contains(where: { $0.group == .passkey }) {
    self.passkeyChallenge = try await oryClient.getPasskeyChallenge(from: loginFlow)
}

// Render fields in your UI
ForEach(viewModel.fields) { field in
    print("\(field.label): \(field.uiNodeAttrModelType))  // e.g. "E-Mail: text"
}

// Submit credentials to login and receive OrySession
let session = try await oryClient.submitLogin(
    flowId: loginFlow.id,
    credentials: LoginCredentials(identifier: "test@test.com", password: "testMe!")
)

// Submit passkey assertion
let session = try await oryClient.submitPasskeyAssertion(
    flowId: loginFlow.id,
    credentialId: credential.credentialID,
    clientDataJSON: credential.rawClientDataJSON,
    authenticatorData: credential.rawAuthenticatorData,
    signature: credential.signature
)

// User logged in
// Show user profile
print("User profile: \(session.identity.traits)")
```

## Architecture Overview

```
┌───────────────────────────────────────────────────────┐
│                      Demo App                         │
│                                                       │
│     ┌───────────┐  ┌─────────────┐  ┌──────────────┐  │
│     │ LoginView │  │ ProfileView │  │ OryFieldView │  │
│     └─────┬─────┘  └─────────────┘  └──────────────┘  │
│           │   │                                       │
│           │ PasskeyHandler                            │
│  ┌────────┴───────┐         ┌──────────┐              │
│  │ LoginViewModel │         │ AppState │              │
│  └────────┬───────┘         └─────┬────┘              │
│           │   │                   │                   │
│───────────────────────────────────────────────────────│
│           │   │                   │                   │
│           │   │      OryAuthSDK   │                   │
│  ┌──────────────────────────────────────┐             │
│  │                                      │             │
│  │        OryAuthClientProtocol         │  Public API │
│  │        OryAuthClient                 │             │
│  │                                      │             │
│  │──────────────────────────────────────│             │
│  │        PasskeyChallengeParser        │             │
│  │    UiNodeParser     SessionStorage   │   Internal  │
│  │                                      │             │
│  │──────────────────────────────────────│             │
│  │                                      │             │
│  │        OryField   OryLoginFlow       │             │
│  │                                      │    Models   │
│  │       OrySession    OryError         │             │
│  │          PasskeyChallenge            │             │
│  └─────────┬────────────────────────────┘             │
│────────────┼──────────────────────────────────────────│
│            │                                          │
│            │          OryClient                       │
│  ┌─────────┼────────────────────────────┐             │
│  │    FrontendAPI, LoginFlow,           │             │
│  │    UiNode, UiNodeAttributes,         │             │
│  │    Session, Identity                 │             │
│  └──────────────────────────────────────┘             │
└───────────────────────────────────────────────────────┘
```

### SDK Boundaries

- **OryClient** — Auto generated from Ory OpenAPI spec
- **OryAuthSDK** — Wrapper SDK used to perform login and parses UiNodes for rendering. Contains the models `OryField`, `OryLoginFlow`, `OrySession`, `OryError`, parser `UiNodeParser` to convert UiNodes into OryFields, `SessionStorage` to store tokens in Keychain, and the public `OryAuthClientProtocol` API.
- **OryDemoApp** — SwiftUI app that utilizes `OryAuthSDK`. Demonstrates headless form rendering from parsed UI nodes provided from login.

### State Management

- **AppState** - Holds the current `OrySession?`. When `session` changes value changes, SwiftUI reactively swaps between `LoginView` and `ProfileView`.
- **LoginViewModel** — Manages initializing flow, parsed fields, form values, login submission, and error handling. Uses `@Published` properties to drive UI updates.
- **PasskeyHandler** - Manages the passkey assertion and authorization. Conforms to `ASAuthorizationControllerDelegate`,
    `ASAuthorizationControllerPresentationContextProviding` required for native passkey.
- **Binding** — `OryFieldView` receives a `Binding<String>` for each field, which creates a binding so user input can be stored in the LoginViewModel's `fieldValues` dictionary.
- **Session** — On successful login, the session token is stored in the Keychain. On app launch, `AppState.checkSession()` attempts to retrieve the session from the stored token.

### Error Model

`OryAuthError` provides typed error model
```swift
.networkError(Error)
.validationError(Error)
.expiredFlow
.unauthorized
.invalidFlow
.unknown(Error)
```

## If I Had 2 More Days

**Registration Flow** — SDK architecture already supports it so adding registration flow should be relatively straightforward.

**Passkeys** - I do not have an Apple developer account so I could not obtain the entitlement to properly test the passkey implementation. If I had more time I would also want to add passkey registration since there is only the login functionality in the demo.

**Identifier-First Login** — Ran into this issue initially since the flow is defaulted to identifier-first login so I would like to add support to handle this scenario.

**Error Handling** - Would like to polish up error handling since I didn't have enough time to go through the various cases.

**Testing** — Add unit tests for the various functionality

**Node rendering** - Would also like to fix how order of how the UiNode fields are rendered. When I enabled passkeys through Ory console, the passkey button was being rendered between the email and password field.

## Running the Demo

1. Clone the repo
2. Open `OryDemoApp.xcodeproj` in Xcode
3. Ensure `OryAuthSDK` is added as a local package dependency.
5. Update the projectURL in `OryDemoApp.swift` with your Ory API endpoint URL.
6. **Cmd + R** to build and run on a simulator

