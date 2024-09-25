//
//  PostGridView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 10.05.2024.
//

import SwiftUI

struct PostGridView: View {
  var posts: [Post]

  private let gridItems: [GridItem] = [
    .init(.flexible(), spacing: 1),
    .init(.flexible(), spacing: 1),
    .init(.flexible(), spacing: 1),
  ]

  var body: some View {
    LazyVGrid(columns: gridItems, spacing: 1) {
      ForEach(posts) { post in
        Image(post.imageUrl)
          .resizable()
          .scaledToFill()
      }
    }
  }
}

#Preview {
  PostGridView(posts: Post.MOCK_POST)
}
