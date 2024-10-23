import Firebase
import Foundation

enum PostService {
  private static let postCollection = Firestore.firestore().collection("posts")

  // static fetch feed posts
  static func fechFeedPosts() async throws -> [Post] {
    let snapshot = try await postCollection.getDocuments()
    var posts = try snapshot.documents.compactMap { try $0.data(as: Post.self) }

    for i in 0 ..< posts.count {
      let post = posts[i]
      let ownerUid = post.ownerUid
      let postUser = try await UserService.fetchUser(withId: ownerUid)
      posts[i].user = postUser
    }

    return posts
  }

  static func fechUserPosts(id: String) async throws -> [Post] {
    let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: id).getDocuments()
    return try snapshot.documents.compactMap { try $0.data(as: Post.self) }
  }
}
