import Foundation

class SearchViewModel: ObservableObject {
  @Published var users = [User]()

  private let userService: UserServiceType
  init(userService: UserServiceType = UserService()) {
    self.userService = userService
    Task {
      try await fetchAllUsers()
    }
  }

  @MainActor
  func fetchAllUsers() async throws {
    users = try await userService.fetchAllUsers()
    print(users)
  }
}
