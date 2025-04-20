import Firebase
import Foundation

@MainActor
class CommentsViewModel: ObservableObject {
  @Published var comments: [Comment] = []

  private let post: Post
  private let commentService: CommentServiceType

  init(post: Post, _ commentService: CommentServiceType = CommentService()) {
    self.post = post
    self.commentService = commentService
    Task { try await fetchComments() }
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
      user: AuthService.shared.currentUser
    )

    do {
      comments.insert(comment, at: 0)
      try await commentService.uploadComment(comment)
    } catch {
      comments.remove(at: 0)
      print(error.localizedDescription)
    }
  }

  func fetchComments() async throws {
    comments = try await commentService.fetchComments(forPostWithId: post.id)
    try await fetchUserDataForComments()
  }

  private func fetchUserDataForComments() async throws {
    for i in 0 ..< comments.count {
      let comment = comments[i]
      let user = try await UserService().fetchUser(withId: comment.commentOwnerUid)
      comments[i].user = user
    }
  }
}
