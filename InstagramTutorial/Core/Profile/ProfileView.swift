//
//  ProfileView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 25.04.24.
//

import SwiftUI

struct ProfileView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
    ]

    var isOwnProfile: Bool

    var user: User

    var body: some View {
        ScrollView {
            VStack {
                // Header
                VStack(spacing: 10) {
                    HStack {
                        profileImage
                        Spacer()
                        HStack(spacing: 42) {
                            statStack(count: 3, description: "Post")
                            statStack(count: 3, description: "Followers")
                            statStack(count: 3, description: "Following")
                        }
                    }
                    .padding(.horizontal)

                    // Name and bio
                    VStack(alignment: .leading, spacing: 4) {
                        if let fullName = user.fullName {
                            Text(fullName)
                                .fontWeight(.semibold)
                        }

                        if let bio = user.bio {
                            Text(bio)
                        }
                    }
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                    // Action button
                    Button {} label: {
                        Text("Edit Profile")
                    }
                    .buttonStyle(.borderedButton)
                    .padding()
                    Divider()
                }

                // post grid view

                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(0 ... 15, id: \.self) { _ in
                        Image(._80Ssunset)
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isOwnProfile {
                Button {} label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.black)
                }
            }
        }
    }

    private var profileImage: some View {
        Image(user.profileImageURL ?? "")
            .resizable()
            .scaledToFill()
            .frame(width: 80, height: 80)
            .clipShape(.circle)
    }

    private func statStack(count: Int, description: String) -> some View {
        VStack {
            Text("\(count)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(description)
                .font(.footnote)
        }
    }
}

#Preview {
    ProfileView(isOwnProfile: true, user: User.MOCK_USERS.first!)
}
