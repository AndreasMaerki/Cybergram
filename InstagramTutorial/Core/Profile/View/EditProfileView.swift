//
//  EditProfileView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 25.09.2024.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var viewModel: EditProfileViewModel

  @State private var error: Error?

  init(user: User) {
    _viewModel = StateObject(wrappedValue: .init(user: user))
  }

  var body: some View {
    VStack {
      toolbar
      editProfilePic
      // edit profile info
      VStack {
        EditProfileRowView(
          title: "Full Name",
          placeholder: "Enter your name...",
          text: $viewModel.fullName
        )

        EditProfileRowView(
          title: "Bio",
          placeholder: "Enter your bio...",
          text: $viewModel.bio
        )
      }

      Spacer()
    }
  }

  private var toolbar: some View {
    VStack {
      HStack {
        Button {
          dismiss()
        } label: {
          Text("Cancel")
        }
        Spacer()
        Text("Edit Profile")
          .font(.subheadline)
          .fontWeight(.semibold)
        Spacer()
        Button {
          Task {
            do {
              try await viewModel.updateUserData()
            } catch {
              self.error = error
            }
          }
        } label: {
          Text("Done")
            .bold()
        }
      }
      .padding()

      Divider()
    }
    .onErrorAlert($error)
  }

  private var editProfilePic: some View {
    PhotosPicker(selection: $viewModel.selectedImage) {
      VStack {
        if let image = viewModel.profileImage {
          image
            .resizable()
            .frame(width: 80, height: 80)
            .foregroundStyle(.white)
            .background(.gray)
            .clipShape(Circle())
        } else {
          Image(systemName: "person")
            .resizable()
            .frame(width: 80, height: 80)
            .foregroundStyle(.white)
            .background(.gray)
            .clipShape(Circle())
        }

        Text("Edit profile picture")
          .font(.footnote)
          .fontWeight(.semibold)

        Divider()
      }
    }
    .padding(.vertical, 8)
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  EditProfileView(user: User.MOCK_USERS.first!)
}
