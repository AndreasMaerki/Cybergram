import Foundation

struct User: Identifiable, Codable, Hashable {
  let id: String

  var userName: String
  var profileImageUrl: String?
  var fullName: String?
  var bio: String?
  let email: String

  var isCurrentUser: Bool {
    id == AuthService.shared.currentUser?.id
  }
}

extension User {
  static var MOCK_USERS: [User] = [
    .init(
      id: UUID().uuidString,
      userName: "Andy",
      profileImageUrl: "veder",
      fullName: "Anreas Maerki",
      bio: "Hello there",
      email: "a@b.ch"
    ),
    .init(
      id: UUID().uuidString,
      userName: "Phil",
      profileImageUrl: "cyborg",
      fullName: "Phil Speicher",
      bio: "Hello there",
      email: "b@b.ch"
    ),
    .init(
      id: UUID().uuidString,
      userName: "Immotep",
      profileImageUrl: "kairo2100",
      fullName: "Immotep Lamahan",
      bio: "Hello there, Pharao of Egypt",
      email: "c@b.ch"
    ),
    .init(
      id: UUID().uuidString,
      userName: "Siren",
      profileImageUrl: "waterrasta",
      fullName: "Serena Sing",
      bio: "From the deep",
      email: "d@b.ch"
    ),
    .init(
      id: UUID().uuidString,
      userName: "Android",
      profileImageUrl: "roofgun",
      fullName: "Electric Sheep",
      bio: "From the sheep",
      email: "e@b.ch"
    ),
  ]
}
