//
//  AppState.swift
//  OryDemoApp
//
//  Created by Benny Wong on 2/25/26.
//

import Foundation
import SwiftUI
import OryAuthSDK
import OryClient
internal import Combine

enum CurrentView {
    case login
    case profile
}

@MainActor
class AppState: ObservableObject {
    @Published var session: OrySession?
        
    let oryClient: OryAuthClient
    
    var isLoggedIn: Bool { session != nil }
    
    init(oryClient: OryAuthClient) {
        self.oryClient = oryClient
    }
    
    func checkSession() async {
        do {
            session = try await oryClient.getSession()
        } catch {
            session = nil
        }
    }
    
    func didLogin(session: OrySession) {
        self.session = session
    }
    
    func logout() async {
        try? await oryClient.logout()
        session = nil
    }
}
