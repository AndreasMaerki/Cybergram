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
  @State var selectedImage: PhotosPickerItem?

  var body: some View {
    VStack {
      toolbar
      editProfilePic
      // edit profile info
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
          // save
        } label: {
          Text("Done")
            .bold()
        }
      }
      .padding()

      Divider()
    }
  }

  private var editProfilePic: some View {
    PhotosPicker(selection: $selectedImage) {
      VStack {
        Image(systemName: "person")
          .resizable()
          .frame(width: 80, height: 80)
          .foregroundStyle(.white)
          .background(.gray)
          .clipShape(Circle())

        Text("Edit profile picture")
          .font(.footnote)
          .fontWeight(.semibold)

        Divider()
      }
    }
    .padding(.vertical, 8)
  }
}

struct EditProfileRowView: View {
  let title: String
  let placeholder: String?
  @Binding var text: String

  var body: some View {
    HStack {
      Text(title)
        .padding(.leading, 8)
        .frame(width: 100, alignment: .leading)
      VStack {
        TextField(placeholder ?? "", text: $text)
        Divider()
      }
    }
    .font(.subheadline)
    .frame(height: 36)
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  EditProfileView()
}
