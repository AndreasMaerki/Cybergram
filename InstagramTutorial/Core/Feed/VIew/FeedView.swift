//
//  FeedView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 26.04.24.
//

import SwiftUI

struct FeedView: View {
  @StateObject var viewmodel = FeedViewModel()

  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 32) {
          ForEach(viewmodel.posts) { post in
            FeedCell(post: post)
          }
        }
        .padding(.top, 8)
      }
      .navigationTitle("Feed")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Text("Instagram")
            .fontWeight(.semibold)
            .italic()
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Image(systemName: "paperplane")
            .imageScale(.large)
        }
      }
    }
  }
}

#Preview {
  FeedView()
}
