//
//  CircularProfileImageView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 29.09.2024.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize: CGFloat {
  case xSmall = 40
  case small = 48
  case medium = 80
  case large = 120
}

struct CircularProfileImageView: View {
  let user: User
  let size: ProfileImageSize

  var body: some View {
    if let imageUrl = URL(string: user.profileImageUrl ?? ""),
       imageUrl.scheme == "https" {
      KFImage(imageUrl)
        .resizable()
        .scaledToFill()
        .frame(width: size.rawValue, height: size.rawValue)
        .clipShape(Circle())
    } else {
      Image(systemName: "person.circle.fill")
        .resizable()
        .scaledToFill()
        .frame(width: size.rawValue, height: size.rawValue)
        .clipShape(Circle())
        .foregroundStyle(.gray)
    }
  }
}

#Preview {
  CircularProfileImageView(user: User.MOCK_USERS.first!, size: .large)
}
