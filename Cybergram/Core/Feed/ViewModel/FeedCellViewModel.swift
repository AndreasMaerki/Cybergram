import Foundation

class FeedCellViewModel: ObservableObject {
  @Published var post: Post

  init(post: Post) {
    self.post = post
  }

  func like() async throws {
    post.didLike = true
    post.likes += 1
  }

  func unlike() async throws {
    post.didLike = false
    post.likes -= 1
  }
}
