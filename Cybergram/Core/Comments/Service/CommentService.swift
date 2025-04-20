import Firebase
import FirebaseFirestore
import Foundation

protocol CommentServiceType {
  func uploadComment(_ comment: Comment) async throws
  func fetchComments(forPostWithId postId: Post.ID) async throws -> [Comment]
}

struct CommentService: CommentServiceType {
  func uploadComment(_ comment: Comment) async throws {
    guard let commentData = try? Firestore.Encoder().encode(comment) else {
      return
    }
    try await FirConstants.postCollection
      .document(comment.postId)
      .collection("post-comments")
      .addDocument(data: commentData)
  }

  func fetchComments(forPostWithId postId: Post.ID) async throws -> [Comment] {
    let snapshot = try await FirConstants.postCollection
      .document(postId)
      .collection("post-comments")
      .order(by: "timestamp", descending: true)
      .getDocuments()

    return snapshot.documents.compactMap { try? $0.data(as: Comment.self) }
  }
}

struct MockCommentService: CommentServiceType {
  func uploadComment(_ comment: Comment) async throws {}

  func fetchComments(forPostWithId postId: Post.ID) async throws -> [Comment] {
    [Comment.MOCK]
  }
}
