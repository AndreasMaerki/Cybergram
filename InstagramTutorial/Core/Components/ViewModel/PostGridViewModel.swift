//
//  postGridViewModel.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 02.10.2024.
//

import Foundation

class PostGridViewModel: ObservableObject {
  @Published var posts: [Post] = []
  private let user: User
  
  init(user: User) {
    self.user = user
    Task {
      try await fetchPosts()
    }
  }
  
  @MainActor
  func fetchPosts() async throws {
    self.posts = try await PostService.fechUserPosts(id: user.id)
    
    for i in 0..<posts.count {
      posts[i].user = user
    }
  }
}
