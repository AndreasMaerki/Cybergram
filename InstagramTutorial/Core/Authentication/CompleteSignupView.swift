//
//  CompleteSignupView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 10.05.2024.
//

import SwiftUI

struct CompleteSignupView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 12) {
            Text("Welcome to Instagram, Andy")
                .font(.title2)
                .fontWeight(.bold)

            Text("Click below to complete registration and start using instagram")
                .modifier(.grayFootnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button {
                dismiss()
            } label: {
                Text("Complete sign up")
            }
            .buttonStyle(.loginButton)
            .padding(.horizontal)
        }
    }
}

#Preview {
    CompleteSignupView()
}
