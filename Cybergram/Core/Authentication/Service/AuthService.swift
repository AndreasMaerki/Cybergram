import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation
import OSLog

class AuthService {
  @Published var userSession: FirebaseAuth.User?

  static let shared = AuthService()

  private let userService: UserService
  private let usersCollection: CollectionReference

  private init(userService: UserService = UserService()) {
    usersCollection = Firestore.firestore().collection("users")
    self.userService = userService
    Task {
      try await loadUserData()
    }
  }

  func login(withEmail email: String, password: String) async throws {
    let result = try await Auth.auth().signIn(withEmail: email, password: password)
    userSession = result.user
    try await loadUserData()
  }

  func createUser(email: String, password: String, userName: String) async throws {
    let result = try await Auth.auth().createUser(withEmail: email, password: password)
    userSession = result.user
    try await uploadUserData(uid: result.user.uid, userName: userName, email: email)
  }

  func loadUserData() async throws {
    userSession = Auth.auth().currentUser
    guard (userSession?.uid) != nil else { return }

    do {
      try await UserService.shared.fetchCurrentUser()
    } catch {
      Logger.firebase.error("No data for user \(error.localizedDescription)")
      signout() // clear data or app might misbehave
      throw error
    }
  }

  func signout() {
    try? Auth.auth().signOut()
    userSession = nil
    UserService.shared.currentUser = nil
  }

  private func uploadUserData(uid: String, userName: String, email: String) async throws {
    let user = User(id: uid, userName: userName, email: email)
    UserService.shared.currentUser = user
    let encodedUser = try Firestore.Encoder().encode(user)

    try await usersCollection.document(user.id).setData(encodedUser)

    Logger.firebase.info("Did upload user data!")
  }
}
