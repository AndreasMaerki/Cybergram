//
//  SearchView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 26.04.24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(User.MOCK_USERS) { user in
                        NavigationLink(value: user) {
                            HStack {
                                Image(user.profileImageURL ?? "")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(.circle)

                                VStack(alignment: .leading) {
                                    Text(user.userName)
                                        .fontWeight(.semibold)

                                    if let fullName = user.fullName {
                                        Text(fullName)
                                    }
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .foregroundColor(.black)
                        }
                    }
                    .padding(.top, 8)
                    .searchable(text: $searchText, prompt: "Search")
                }
                .navigationDestination(for: User.self, destination: { user in
                    ProfileView(isOwnProfile: false, user: user)
                })
                .navigationTitle("Explore")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    SearchView()
}
