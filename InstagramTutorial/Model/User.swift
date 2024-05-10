//
//  User.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 10.05.2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String

    var userName: String
    var profileImageURL: String?
    var fullName: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(
            id: UUID().uuidString,
            userName: "Andy",
            profileImageURL: "veder",
            fullName: "Anreas Maerki",
            bio: "Hello there",
            email: "a@b.ch"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Phil",
            profileImageURL: "cyborg",
            fullName: "Phil Speicher",
            bio: "Hello there",
            email: "b@b.ch"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Immotep",
            profileImageURL: "kairo2100",
            fullName: "Immotep Lamahan",
            bio: "Hello there, Pharao of Egypt",
            email: "c@b.ch"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Siren",
            profileImageURL: "waterrasta",
            fullName: "Serena Sing",
            bio: "From the deep",
            email: "d@b.ch"
        ),
        .init(
            id: UUID().uuidString,
            userName: "Android",
            profileImageURL: "roofgun",
            fullName: "Electric Sheep",
            bio: "From the sheep",
            email: "e@b.ch"
        ),
    ]
}
