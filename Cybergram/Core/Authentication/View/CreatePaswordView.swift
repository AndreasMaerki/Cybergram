import SwiftUI

struct CreatePaswordView: View {
  @Environment(RegistrationViewModel.self) var viewModel

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

      SecureField("Password", text: Bindable(viewModel).password)
        .textFieldStyle(.primaryTextField)
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
    .background(Color.primaryBackground)
  }
}

#Preview {
  CreatePaswordView()
    .environment(RegistrationViewModel())
    .preferredColorScheme(.dark)
}
