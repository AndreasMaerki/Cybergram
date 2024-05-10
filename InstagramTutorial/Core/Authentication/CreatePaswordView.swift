//
//  CreatePaswordView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 03.05.2024.
//

import SwiftUI

struct CreatePaswordView: View {
    @State private var password = ""

    var body: some View {
        VStack(spacing: 12) {
            Text("Create a password")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text("Your password must be at least 6 characters in length")
                .modifier(.grayFootnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            SecureField("Email", text: $password)
                .textFieldStyle(.loginTextField)
                .padding()

            NavigationLink {
                CompleteSignupView()
            } label: {
                Text("Sign up")
            }
            .buttonStyle(.loginButton)
            .padding(.horizontal)

            Spacer()
        }
    }
}

#Preview {
    CreatePaswordView()
}
