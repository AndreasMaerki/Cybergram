//
//  AddUserNameView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 03.05.2024.
//

import SwiftUI

struct AddUserNameView: View {
    @State private var username = ""

    var body: some View {
        VStack(spacing: 12) {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text("You'll use this email to sign in to your account")
                .modifier(.grayFootnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            TextField("Password", text: $username)
                .textFieldStyle(.loginTextField)
                .padding()

            NavigationLink {
                CreatePaswordView()
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
    AddUserNameView()
}
