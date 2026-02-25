//
//  OryDemoApp.swift
//  OryDemoApp
//
//  Created by Benny Wong on 2/24/26.
//

import SwiftUI
import OryAuthSDK
import OryClient

@main
struct OryDemoApp: App {
    @StateObject private var appState: AppState
    
    init() {
        let projectURL = "https://unruffled-chatterjee-lgs5rlnnc7.projects.oryapis.com"
        let oryClient = OryAuthClient(projectBaseURL: projectURL)
        _appState = StateObject(wrappedValue: AppState(oryClient: oryClient))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
