import Kingfisher
import SwiftUI

struct PostGridView: View {
  @EnvironmentObject var viewModel: PostGridViewModel

  private let gridItems: [GridItem] = [
    .init(.flexible(), spacing: 1),
    .init(.flexible(), spacing: 1),
    .init(.flexible(), spacing: 1),
  ]

  var body: some View {
    LazyVGrid(columns: gridItems, spacing: 1) {
      ForEach(viewModel.posts) { post in
        KFImage(URL(string: post.imageUrl))
          .resizable()
          .scaledToFill()
      }
    }
  }
}

#Preview {
  PostGridView()
    .environmentObject(
      PostGridViewModel(
        user: User.MOCK_USERS.first!,
        postService: MockPostService()
      )
    )
}
