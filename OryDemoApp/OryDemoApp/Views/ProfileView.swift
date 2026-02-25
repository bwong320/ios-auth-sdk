//
//  ProfileView.swift
//  OryDemoApp
//
//  Created by Benny Wong on 2/25/26.
//

import SwiftUI
import OryAuthSDK

struct ProfileView: View {
    let session: OrySession
    let onLogout: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Logged In!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("Profile")
                    .font(.headline)
                
                identityTraits
                Divider()
                sessionId
            }
            
            Spacer()
            logoutButton
        }
        .padding()
    }
    
    @ViewBuilder
    private var identityTraits: some View {
        ForEach(Array(session.identity.traits), id: \.key) { key, value in
            HStack {
                Text(key)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                Spacer()
                Text(value)
            }
        }
    }
    
    @ViewBuilder
    private var sessionId: some View {
        HStack {
            Text("Session ID")
                .fontWeight(.medium)
                .foregroundColor(.secondary)
            Spacer()
            Text(session.id)
                .font(.caption)
                .monospaced()
        }
    }
    
    @ViewBuilder
    private var logoutButton: some View {
        Button(role: .destructive) {
            onLogout()
        } label: {
            Text("Log Out")
        }
        .buttonStyle(.borderedProminent)
        .tint(.red)
    }
}
