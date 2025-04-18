import Firebase
import Foundation
import OSLog

protocol UserServiceType {
  func fetchAllUsers() async throws -> [User]

  func fetchUser(withId id: String) async throws -> User?
}

struct UserService: UserServiceType {
  func fetchAllUsers() async throws -> [User] {
    let snapshot = try await Firestore.firestore().collection("users").getDocuments()
    return snapshot.documents.compactMap { try? $0.data(as: User.self) }
  }

  func fetchUser(withId id: String) async throws -> User? {
    let snapshot = try await Firestore.firestore().collection("users").document(id).getDocument()
    return try? snapshot.data(as: User.self)
  }
}

struct MockUserService: UserServiceType {
  func fetchAllUsers() async throws -> [User] {
    User.MOCK_USERS
  }

  func fetchUser(withId id: String) async throws -> User? {
    .MOCK_USERS.first { $0.id == id }
  }
}
