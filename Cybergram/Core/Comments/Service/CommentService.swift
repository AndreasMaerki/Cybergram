import Firebase
import FirebaseFirestore
import Foundation

protocol CommentServiceType {
  func uploadComment(_ comment: Comment) async throws
}

struct CommentService: CommentServiceType {
  func uploadComment(_ comment: Comment) async throws {
    guard let commentData = try? Firestore.Encoder().encode(comment) else {
      return
    }
    try await Firestore
      .firestore()
      .collection("posts")
      .document(comment.postId)
      .collection("post-comments")
      .addDocument(data: commentData)
  }
}

struct MockCommentService: CommentServiceType {
  func uploadComment(_ comment: Comment) async throws {}
}
