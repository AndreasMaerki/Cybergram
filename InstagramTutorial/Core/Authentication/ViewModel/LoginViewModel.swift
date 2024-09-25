//
//  LoginViewModel.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 17.06.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
  @Published var email = ""
  @Published var password = ""

  func signIn() async throws {
    try await AuthService.shared.login(withEmail: email, password: password)
  }
}
