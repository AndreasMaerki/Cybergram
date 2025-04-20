import Firebase

enum FirConstants {
  private static let root = Firestore.firestore()

  static var userCollection = root.collection("users")

  static var postCollection = root.collection("posts")
}
