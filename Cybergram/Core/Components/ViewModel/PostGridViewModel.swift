import Foundation

@Observable
class PostGridViewModel {
  var posts: [Post] = []

  private let user: User
  private let postService: PostServiceType

  init(user: User, postService: PostServiceType = PostService()) {
    self.postService = postService
    self.user = user
    Task {
      try await fetchPosts()
    }
  }

  @MainActor
  func fetchPosts() async throws {
    posts = try await postService.fetchUserPosts(id: user.id)

    for i in 0 ..< posts.count {
      posts[i].user = user
    }
  }
}
