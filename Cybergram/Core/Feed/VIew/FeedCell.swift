import Kingfisher
import OSLog
import SwiftUI

struct FeedCell: View {
  @EnvironmentObject var viewModel: FeedViewModel
  @State private var showComments = false

  var post: Post

  private var didLike: Bool {
    post.didLike ?? false
  }

  var body: some View {
    VStack(alignment: .leading) {
      userImageAndName
        .padding(.horizontal, 8)

      KFImage(URL(string: post.imageUrl))
        .resizable()
        .scaledToFit()
        .clipShape(.rect)
        .frame(maxHeight: UIScreen.main.bounds.width)
        .background(Color.gray.opacity(0.5))

      actionButtons
        .padding(.horizontal, 8)
        .padding(.top, 4)

      if post.likes > 0 {
        likesLabel
      }

      HStack {
        Text("\(post.user?.userName ?? "") ").fontWeight(.semibold) +
          Text(post.caption)
      }
      .font(.footnote)
      .padding(.horizontal, 10)
      .padding(.top, 0.5)

      Text("\(post.timestamp.timestampString()) ago")
        .modifier(.grayFootnote)
        .padding(.horizontal, 10)
        .padding(.top, 1)
    }
    .sheet(isPresented: $showComments) {
      CommentsView()
        .presentationDetents([.fraction(0.6)])
        .presentationDragIndicator(.visible)
        .environmentObject(CommentsViewModel(post: post))
    }
    .task {
      try? await viewModel.checkIfLiked(post)
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
          .foregroundStyle(didLike ? .red : Color.primary)
      }
      Button {
        Logger.statistics.info("comment")
        showComments.toggle()
      } label: {
        Image(systemName: "bubble.right")
          .foregroundStyle(Color.primary)
      }
      Button {
        Logger.statistics.info("share")
      } label: {
        Image(systemName: "paperplane")
          .foregroundStyle(Color.primary)
      }

      Spacer()
    }
    .imageScale(.large)
    .foregroundStyle(.buttonBackground)
  }

  private var likesLabel: some View {
    Text("\(post.likes) likes")
      .font(.footnote)
      .fontWeight(.semibold)
      .padding(.horizontal, 10)
      .padding(.top, 1)
  }

  private func handleLike() {
    Task {
      if didLike {
        try await viewModel.unlike(post)
      } else {
        try await viewModel.like(post)
      }
    }
  }
}

#Preview {
  FeedCell(post: Post.MOCK_POSTS.first!)
    .environmentObject(
      FeedViewModel(postService: MockPostService())
    )
}
