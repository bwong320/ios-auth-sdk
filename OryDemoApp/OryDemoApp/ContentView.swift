//
//  ContentView.swift
//  OryDemoApp
//
//  Created by Benny Wong on 2/24/26.
//

import SwiftUI
import OryAuthSDK
import OryClient

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Group {
            if appState.isLoggedIn, let session = appState.session {
                ProfileView(session: session) {
                    Task { await appState.logout() }
                }
            } else {
                LoginView(oryClient: appState.oryClient) { session in
                    appState.didLogin(session: session)
                }
            }
        }
        .task {
            await appState.checkSession()
        }
    }
}
