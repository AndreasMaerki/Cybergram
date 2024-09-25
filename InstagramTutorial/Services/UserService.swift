//
//  UserService.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 17.06.2024.
//

import Firebase
import Foundation
import OSLog

enum UserService {
  static func fetchAllUsers() async throws -> [User] {
    let snapshot = try await Firestore.firestore().collection("users").getDocuments()
    return snapshot.documents.compactMap { try? $0.data(as: User.self) }
  }
}
