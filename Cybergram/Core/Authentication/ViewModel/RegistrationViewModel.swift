import Foundation

@Observable
class RegistrationViewModel {
  var userName = ""
  var email = ""
  var password = ""

  func createUser() async throws {
    try await AuthService.shared.createUser(email: email, password: password, userName: userName)
    await clearData()
  }

  @MainActor
  private func clearData() {
    userName = ""
    email = ""
    password = ""
  }
}
