import SwiftUI

struct AddUserNameView: View {
  @Environment(RegistrationViewModel.self) var viewModel

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

      TextField("User name", text: Bindable(viewModel).userName)
        .textFieldStyle(.primaryTextField)
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
    .background(Color.primaryBackground)
  }
}

#Preview {
  AddUserNameView()
    .environment(RegistrationViewModel())
}
