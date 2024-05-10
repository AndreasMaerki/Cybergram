//
//  MainTabView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 25.04.24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }
            NavigationStack {
                ProfileView(isOwnProfile: true, user: User.MOCK_USERS.first!)
            }
            .tabItem {
                Image(systemName: "person")
            }
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView()
}
