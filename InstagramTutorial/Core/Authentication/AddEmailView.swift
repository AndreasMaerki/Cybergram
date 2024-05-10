//
//  AddEmailView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 03.05.2024.
//

import SwiftUI

struct AddEmailView: View {
    @State private var email = ""

    var body: some View {
        VStack(spacing: 12) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text("You'll use this email to sign in to your account")
                .modifier(.grayFootnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            TextField("Email", text: $email)
                .textFieldStyle(.loginTextField)
                .padding()

            NavigationLink {
                AddUserNameView()
            } label: {
                Text("Next")
            }
            .buttonStyle(.loginButton)
            .padding(.horizontal)

            Spacer()
        }
    }
}

#Preview {
    AddEmailView()
}
