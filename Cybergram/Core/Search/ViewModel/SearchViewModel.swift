import Foundation

class SearchViewModel: ObservableObject {
  @Published var users = [User]()

  init() {
    Task {
      try await fetchAllUsers()
    }
  }

  @MainActor
  func fetchAllUsers() async throws {
//    users = User.MOCK_USERS
    users = try await UserService.fetchAllUsers()
    print(users)
  }
}
