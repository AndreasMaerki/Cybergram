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
      profileImageUrl: "https://picsum.photos/100",
      fullName: "Anreas Maerki",
      bio: "Hello there",
      email: "a@b.ch"
    ),
    .init(
      id: UUID().uuidString,
      userName: "Phil",
      profileImageUrl: "https://picsum.photos/100",
      fullName: "Phil Speicher",
      bio: "Hello there",
      email: "b@b.ch"
    ),
    .init(
      id: UUID().uuidString,
      userName: "Immotep",
      profileImageUrl: "https://picsum.photos/100",
      fullName: "Immotep Lamahan",
      bio: "Hello there, Pharao of Egypt",
      email: "c@b.ch"
    ),
    .init(
      id: UUID().uuidString,
      userName: "Siren",
      profileImageUrl: "https://picsum.photos/100",
      fullName: "Serena Sing",
      bio: "From the deep",
      email: "d@b.ch"
    ),
    .init(
      id: UUID().uuidString,
      userName: "Android",
      profileImageUrl: "https://picsum.photos/100",
      fullName: "Electric Sheep",
      bio: "From the sheep",
      email: "e@b.ch"
    ),
  ]
}
