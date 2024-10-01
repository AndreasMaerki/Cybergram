//
//  FeedViewModel.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 01.10.2024.
//

import Foundation
import Firebase

@MainActor
class FeedViewModel: ObservableObject {
  @Published var posts: [Post] = []
  @Published var error: Error?

  init() {
    Task {
      do {
        try await fetchPosts(limit: 20)
      } catch {
        print("Error fetching posts: \(error.localizedDescription)")
        self.error = error
      }
    }
  }

  func fetchPosts(limit: Int) async throws {
    let snapshot = try await Firestore.firestore().collection("posts").limit(to: limit).getDocuments()
    self.posts = try snapshot.documents.compactMap { try $0.data(as: Post.self) }

    for i in 0 ..< self.posts.count {
      let post = self.posts[i]
      let ownerUid = post.ownerUid
      let postUser = try await UserService.fetchUser(withId: ownerUid)
      posts[i].user = postUser
    }
  }
}
