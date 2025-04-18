import Kingfisher
import OSLog
import SwiftUI

struct FeedCell: View {
  @ObservedObject var viewModel: FeedCellViewModel

  private var post: Post {
    viewModel.post
  }

  private var didLike: Bool {
    viewModel.post.didLike ?? false
  }

  init(post: Post) {
    viewModel = .init(post: post)
  }

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
        handleLike()
      } label: {
        Image(systemName: didLike ? "heart.fill" : "heart")
          .imageScale(.large)
          .foregroundStyle(didLike ? .red : .black)
      }
      Button {
        Logger.statistics.info("comment")
      } label: {
        Image(systemName: "bubble.right")
          .imageScale(.large)
      }
      Button {
        Logger.statistics.info("share")
      } label: {
        Image(systemName: "paperplane")
          .imageScale(.large)
      }

      Spacer()
    }
    .imageScale(.large)
    .foregroundStyle(.buttonBackground)
  }

  private func handleLike() {
    Task {
      if didLike {
        try await viewModel.unlike()
      } else {
        try await viewModel.like()
      }
    }
  }
}

#Preview {
  FeedCell(post: Post.MOCK_POSTS[0])
}
