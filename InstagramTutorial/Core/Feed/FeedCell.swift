//
//  FeedCell.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 26.04.24.
//

import OSLog
import SwiftUI

struct FeedCell: View {
  var post: Post

  var body: some View {
    VStack(alignment: .leading) {
      // image + user name
      userImageAndName
        .padding(.horizontal, 8)

      // post image
      Image(post.imageUrl)
        .resizable()
        .scaledToFit()
        .clipShape(.rect)

      // action buttons
      actionButtons
        .padding(.horizontal, 8)
        .padding(.top, 4)

      Text("\(post.likes) likes")
        .font(.footnote)
        .fontWeight(.semibold)
        .padding(.horizontal, 10)
        .padding(.top, 1)
      HStack {
        Text("\(post.user?.userName ?? "") ").fontWeight(.semibold) +
        Text(post.caption)
      }
      .font(.footnote)
      .padding(.horizontal, 10)
      .padding(.top, 0.5)

      Text("6h ago")
        .modifier(.grayFootnote)
        .padding(.horizontal, 10)
        .padding(.top, 1)
    }
  }

  private var userImageAndName: some View {
    HStack {
      if let user = post.user {
        Image(user.profileImageURL ?? "")
          .resizable()
          .scaledToFill()
          .frame(width: 40, height: 40)
          .clipShape(.circle)

        Text(user.userName)
          .font(.footnote)
          .fontWeight(.semibold)
      }
    }
  }

  private var actionButtons: some View {
    HStack {
      Button {
        Logger.viewCycle.info("liked")
      } label: {
        Image(systemName: "heart")
      }
      Button {
        Logger.viewCycle.info("comment")
      } label: {
        Image(systemName: "bubble.right")
      }
      Button {
        Logger.viewCycle.info("share")
      } label: {
        Image(systemName: "paperplane")
      }

      Spacer()
    }
    .imageScale(.large)
    .foregroundColor(.black)
  }
}

#Preview {
  FeedCell(post: Post.MOCK_POST[0])
}
