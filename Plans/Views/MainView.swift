//
//  ContentView.swift
//  Plans
//
//  Created by Mehmet ALAN on 17.05.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            PlansListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label(
                        "Home",
                        systemImage: "house"
                    )
                }
            ProfileView()
                .tabItem {
                    Label(
                        "Profile",
                        systemImage: "person.circle"
                    )
                }
        }
    }
}

#Preview {
    MainView()
}
