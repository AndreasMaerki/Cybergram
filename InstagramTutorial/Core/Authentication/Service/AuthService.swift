import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation
import OSLog

class AuthService {
  @Published var userSession: FirebaseAuth.User?
  @Published var currentUser: User?

  static let shared = AuthService()

  private let usersCollection: CollectionReference

  private init() {
    usersCollection = Firestore.firestore().collection("users")
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
    guard let currentUid = userSession?.uid else { return }
    let snapshot = try await usersCollection.document(currentUid).getDocument()

    if let data = snapshot.data() {
      Logger.firebase.info("Snapshot data is: \(data)")
      currentUser = try snapshot.data(as: User.self)
    } else {
      Logger.firebase.error("No data for user found")
      signout() // clear data or app might misbehave
    }
  }

  func signout() {
    try? Auth.auth().signOut()
    userSession = nil
    currentUser = nil
  }

  private func uploadUserData(uid: String, userName: String, email: String) async throws {
    currentUser = User(id: uid, userName: userName, email: email)
    let encodedUser = try Firestore.Encoder().encode(currentUser!)

    try await usersCollection.document(currentUser!.id).setData(encodedUser)

    Logger.firebase.info("Did upload user data!")
  }
}
