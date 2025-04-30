import Foundation

@Observable
class LoginViewModel {
  var email = ""
  var password = ""

  func signIn() async throws {
    try await AuthService.shared.login(withEmail: email, password: password)
  }
}
