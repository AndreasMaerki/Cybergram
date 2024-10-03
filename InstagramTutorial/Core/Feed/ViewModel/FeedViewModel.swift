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
    self.posts = try await PostService.fechFeedPosts()

  }
}
