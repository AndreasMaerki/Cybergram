import Foundation

class PostGridViewModel: ObservableObject {
  @Published var posts: [Post] = []
  private let user: User

  init(user: User) {
    self.user = user
    Task {
      try await fetchPosts()
    }
  }

  @MainActor
  func fetchPosts() async throws {
    posts = try await PostService.fechUserPosts(id: user.id)

    for i in 0 ..< posts.count {
      posts[i].user = user
    }
  }
}
