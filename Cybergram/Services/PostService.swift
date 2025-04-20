import Firebase
import Foundation

protocol PostServiceType {
  func fetchFeedPosts() async throws -> [Post]
  func fetchUserPosts(id: String) async throws -> [Post]
  func likePost(_ post: Post) async throws
  func unlikePost(_ post: Post) async throws
  func checkIfUserLikedPost(_ post: Post) async throws -> Bool
}

struct PostService: PostServiceType {
  private let postCollection = FirConstants.postCollection
  private let userCollection = FirConstants.userCollection

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

  func likePost(_ post: Post) async throws {
    guard let uid = Auth.auth().currentUser?.uid else {
      return
    }

    async let _ = try postCollection.document(post.id).collection("post-likes").document(uid).setData([:])
    async let _ = try postCollection.document(post.id).updateData(["likes": post.likes])
    async let _ = userCollection.document(uid).collection("user-likes").document(post.id).setData([:])
  }

  func unlikePost(_ post: Post) async throws {
    guard let uid = Auth.auth().currentUser?.uid else { return }

    async let _ = try postCollection.document(post.id).collection("post-likes").document(uid).delete()
    async let _ = try postCollection.document(post.id).updateData(["likes": post.likes])
    async let _ = userCollection.document(uid).collection("user-likes").document(post.id).delete()
  }

  func checkIfUserLikedPost(_ post: Post) async throws -> Bool {
    guard let uid = Auth.auth().currentUser?.uid else { return false }

    let snapshot = try await userCollection.document(uid).collection("user-likes").document(post.id).getDocument()
    return snapshot.exists
  }
}

struct MockPostService: PostServiceType {
  func checkIfUserLikedPost(_ post: Post) async throws -> Bool {
    Bool.random()
  }

  func likePost(_ post: Post) async throws {}

  func unlikePost(_ post: Post) async throws {}

  func fetchFeedPosts() async throws -> [Post] {
    Post.MOCK_POSTS
  }

  func fetchUserPosts(id: String) async throws -> [Post] {
    Post.MOCK_POSTS
  }
}
