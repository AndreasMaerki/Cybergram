import Firebase
import Foundation

@MainActor
class FeedViewModel: ObservableObject {
  @Published var posts: [Post] = []
  @Published var error: Error?

  private let postService: PostServiceType

  init(postService: PostServiceType = PostService()) {
    self.postService = postService
    Task {
      do {
        try await fetchPosts(limit: 20)
      } catch {
        print("Error fetching posts: \(error.localizedDescription)")
        self.error = error
      }
    }
  }

  func fetchPosts(limit: Int) async throws {
    posts = try await postService.fetchFeedPosts()
  }

  func like(_ post: Post) async throws {
    guard let index = posts.firstIndex(of: post) else { return }
    do {
      posts[index].didLike = true
      posts[index].likes += 1
      try await postService.likePost(posts[index])
    } catch {
      posts[index].didLike = false
      posts[index].likes -= 1
    }
  }

  func unlike(_ post: Post) async throws {
    guard let index = posts.firstIndex(of: post) else { return }
    do {
      posts[index].didLike = false
      posts[index].likes -= 1
      try await postService.unlikePost(posts[index])
    } catch {
      posts[index].didLike = true
      posts[index].likes += 1
    }
  }

  // TODO: This is highly inefficient the way cells are dequeued.
  // Find a way to avoid subsequent calls
  func checkIfLiked(_ post: Post) async throws {
    guard let index = posts.firstIndex(of: post) else { return }
    posts[index].didLike = try await postService.checkIfUserLikedPost(posts[index])
  }
}
