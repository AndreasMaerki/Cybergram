//
//  FeedCell.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 26.04.24.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            // image + user name
            userImageAndName
                .padding(.horizontal, 8)

            // post image
            Image(.kairo2100)
                .resizable()
                .scaledToFit()
                .clipShape(.rect)

            // action buttons
            actionButtons
                .padding(.horizontal, 8)
                .padding(.top, 4)

            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.horizontal, 10)
                .padding(.top, 1)
            HStack {
                Text("Egypt ").fontWeight(.semibold) +
                    Text("Kairo in the year 2100 Kairo in the year 2100 Kairo in the year 2100")
            }
            .font(.footnote)
            .padding(.horizontal, 10)
            .padding(.top, 0.5)

            Text("6h ago")
                .font(.footnote)
                .padding(.horizontal, 10)
                .foregroundColor(.gray)
                .padding(.top, 1)
        }
    }

    private var userImageAndName: some View {
        HStack {
            Image(.kairo2100)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(.circle)

            Text("Kairo")
                .font(.footnote)
                .fontWeight(.semibold)
        }
    }

    private var actionButtons: some View {
        HStack {
            Button {
                print("liked")
            } label: {
                Image(systemName: "heart")
            }
            Button {
                print("comment")
            } label: {
                Image(systemName: "bubble.right")
            }
            Button {
                print("liked")
            } label: {
                Image(systemName: "paperplane")
            }

            Spacer()
        }
        .imageScale(.large)
        .foregroundColor(.black)
    }
}

#Preview {
    FeedCell()
}
