import Firebase
import Foundation

class CommentsViewModel: ObservableObject {
  @Published var comments: [Comment] = []

  private let post: Post
  private let commentService: CommentServiceType

  init(post: Post, _ commentService: CommentServiceType = CommentService()) {
    self.post = post
    self.commentService = commentService
  }

  func uploadComment(_ commentText: String) async throws {
    guard let uid = Auth.auth().currentUser?.uid else {
      return
    }

    let comment = Comment(
      postOwnerUid: post.ownerUid,
      text: commentText,
      postId: post.id,
      timestamp: Date(),
      commentOwnerUid: uid,
      user: nil
    )

    try await commentService.uploadComment(comment)
  }
}
