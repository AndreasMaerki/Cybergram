import Kingfisher
import OSLog
import SwiftUI

struct FeedCell: View {
  var post: Post

  var body: some View {
    VStack(alignment: .leading) {
      userImageAndName
        .padding(.horizontal, 8)

      KFImage(URL(string: post.imageUrl))
        .resizable()
        .scaledToFit()
        .clipShape(.rect)

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
        CircularProfileImageView(user: user, size: .xSmall)

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
