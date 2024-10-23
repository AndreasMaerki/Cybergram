import Firebase
import Foundation

@MainActor
class FeedViewModel: ObservableObject {
  @Published var posts: [Post] = []
  @Published var error: Error?

  init() {
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
    posts = try await PostService.fechFeedPosts()
  }
}
