import SwiftUI

struct AddEmailView: View {
  @Environment(RegistrationViewModel.self) var viewModel

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

      TextField("Email", text: Bindable(viewModel).email)
        .textFieldStyle(.primaryTextField)
        .keyboardType(.emailAddress)
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
    .background(Color.primaryBackground)
  }
}

#Preview {
  AddEmailView()
    .environment(RegistrationViewModel())
}
