//
//  Post.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 10.05.2024.
//
import Foundation

struct Post: Identifiable, Codable, Hashable {
  let id: String
  let ownerUid: String
  let caption: String
  var likes: Int
  let imageUrl: String
  let timestamp: Date
  var user: User?
}

extension Post {
  static var MOCK_POSTS: [Post] = [
    .init(
      id: UUID().uuidString,
      ownerUid: UUID().uuidString,
      caption: "Whatever test caption",
      likes: 23,
      imageUrl: "https://picsum.photos/300",
      timestamp: Date(),
      user: User.MOCK_USERS[0]
    ),
    .init(
      id: UUID().uuidString,
      ownerUid: UUID().uuidString,
      caption: "Test caption for another user post",
      likes: 23,
      imageUrl: "https://picsum.photos/300",
      timestamp: Date(),
      user: User.MOCK_USERS[2]
    ),
    .init(
      id: UUID().uuidString,
      ownerUid: UUID().uuidString,
      caption: "Nudelgericht für Feinschmecker",
      likes: 400,
      imageUrl: "https://picsum.photos/300",
      timestamp: Date(),
      user: User.MOCK_USERS[1]
    ),
    .init(
      id: UUID().uuidString,
      ownerUid: UUID().uuidString,
      caption: "A gun is fun",
      likes: 2,
      imageUrl: "https://picsum.photos/300",
      timestamp: Date(),
      user: User.MOCK_USERS[3]
    ),
    .init(
      id: UUID().uuidString,
      ownerUid: UUID().uuidString,
      caption: "Standim on the rooftop like a boss",
      likes: 29,
      imageUrl: "https://picsum.photos/300",
      timestamp: Date(),
      user: User.MOCK_USERS[2]
    ),
  ]
}
