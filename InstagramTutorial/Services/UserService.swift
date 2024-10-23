import Firebase
import Foundation
import OSLog

enum UserService {
  static func fetchAllUsers() async throws -> [User] {
    let snapshot = try await Firestore.firestore().collection("users").getDocuments()
    return snapshot.documents.compactMap { try? $0.data(as: User.self) }
  }

  static func fetchUser(withId id: String) async throws -> User? {
    let snapshot = try await Firestore.firestore().collection("users").document(id).getDocument()
    return try? snapshot.data(as: User.self)
  }
}
