//
//  PostGridView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 10.05.2024.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
  @StateObject var viewModel: PostGridViewModel
  
  init(user: User) {
    _viewModel = .init(wrappedValue: .init(user: user))
  }
  
  private let gridItems: [GridItem] = [
    .init(.flexible(), spacing: 1),
    .init(.flexible(), spacing: 1),
    .init(.flexible(), spacing: 1),
  ]
  
  var body: some View {
    LazyVGrid(columns: gridItems, spacing: 1) {
      ForEach(viewModel.posts) { post in
        KFImage(URL(string: post.imageUrl))
          .resizable()
          .scaledToFill()
      }
    }
  }
}

#Preview {
  PostGridView(user: User.MOCK_USERS.first!)
}
