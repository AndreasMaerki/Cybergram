import Firebase
import Foundation

protocol PostServiceType {
  func fetchFeedPosts() async throws -> [Post]
  func fetchUserPosts(id: String) async throws -> [Post]
}

struct PostService: PostServiceType {
  private let postCollection = Firestore.firestore().collection("posts")

  func fetchFeedPosts() async throws -> [Post] {
    let snapshot = try await postCollection.getDocuments()
    var posts = try snapshot.documents.compactMap { try $0.data(as: Post.self) }

    for i in 0 ..< posts.count {
      let post = posts[i]
      let ownerUid = post.ownerUid
      let postUser = try await UserService().fetchUser(withId: ownerUid)
      posts[i].user = postUser
    }

    return posts
  }

  func fetchUserPosts(id: String) async throws -> [Post] {
    let snapshot = try await postCollection.whereField("ownerUid", isEqualTo: id).getDocuments()
    return try snapshot.documents.compactMap { try $0.data(as: Post.self) }
  }
}

struct MockPostService: PostServiceType {
  func fetchFeedPosts() async throws -> [Post] {
    Post.MOCK_POSTS
  }

  func fetchUserPosts(id: String) async throws -> [Post] {
    Post.MOCK_POSTS
  }
}
