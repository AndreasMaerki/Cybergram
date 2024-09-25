//
//  AddEmailView.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 03.05.2024.
//

import SwiftUI

struct AddEmailView: View {
    @EnvironmentObject var viewModel: RegistrationViewModel

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

            TextField("Email", text: $viewModel.email)
                .textFieldStyle(.loginTextField)
                .padding()
                .textInputAutocapitalization(.never)

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
