import FirebaseFirestoreSwift
import Foundation

struct Comment: Codable, Identifiable {
  @DocumentID var commentId: String?
  let postOwnerUid: String
  let text: String
  let postId: String
  let timestamp: Date
  let commentOwnerUid: String

  let user: User?

  var id: String { commentId ?? UUID().uuidString }
}

extension Comment {
  static var MOCK = Comment(
    postOwnerUid: "1234",
    text: "Hello World",
    postId: "32134",
    timestamp: Date(),
    commentOwnerUid: "1234321",
    user: .MOCK_USERS.first
  )
}
