//
//  SearchViewModel.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 17.06.2024.
//

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
