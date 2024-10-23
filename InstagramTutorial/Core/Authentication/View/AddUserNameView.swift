import SwiftUI

struct AddUserNameView: View {
  @EnvironmentObject var viewModel: RegistrationViewModel

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

      TextField("User name", text: $viewModel.userName)
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
