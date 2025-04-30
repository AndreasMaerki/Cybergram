import SwiftUI

struct FeedView: View {
  @Environment(FeedViewModel.self) var viewModel

  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 32) {
          ForEach(viewModel.posts) { post in
            FeedCell(post: post)
          }
        }
        .padding(.top, 8)
      }
      .navigationTitle("Feed")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Image(.cyberGram)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 100)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Image(systemName: "paperplane")
            .imageScale(.large)
            .foregroundStyle(.buttonBackground)
        }
      }
      .background(Color.primaryBackground)
      .task {
        try? await viewModel.fetchPosts(limit: 20)
      }
    }
  }
}

#Preview {
  FeedView()
    .environment(FeedViewModel(postService: MockPostService()))
}
