import SwiftUI

struct LoginView: View {
  @State private var errorMessage = ""
  @State private var showAlert = false

  @State var viewModel = LoginViewModel()

  var body: some View {
    NavigationStack {
      VStack {
        Spacer()
        cyberLogo

        textFields
          .padding(.horizontal)

        forgotPasswordBTN

        loginBTN

        orDivider
          .padding()

        withFBBTN

        Spacer()

        Divider()

        signUpLink
      }
      .alert(isPresented: $showAlert) {
        .init(
          title: Text("Oops"),
          message: Text(errorMessage).bold(),
          dismissButton: .cancel()
        )
      }
      .background(Color.primaryBackground)
    }
  }

  private var cyberLogo: some View {
    Image(.cyberGram)
      .resizable()
      .renderingMode(.template)
      .scaledToFit()
      .padding(.horizontal, 36)
      .padding(.vertical, 24)
      .foregroundStyle(.primaryForeground)
  }

  private var textFields: some View {
    VStack {
      TextField("Enter your email", text: $viewModel.email)
        .textInputAutocapitalization(.never)
        .keyboardType(.emailAddress)

      SecureField("Enter your password", text: $viewModel.password)
    }
    .textFieldStyle(.primaryTextField)
  }

  private var forgotPasswordBTN: some View {
    Button {} label: {
      Text("forgot password")
        .font(.footnote)
        .fontWeight(.semibold)
        .padding(.top)
        .padding(.trailing)
    }
    .frame(maxWidth: .infinity, alignment: .trailing)
  }

  private var loginBTN: some View {
    Button {
      Task {
        do {
          try await viewModel.signIn()
        } catch {
          errorMessage = error.localizedDescription
          showAlert = true
        }
      }
    } label: {
      Text("Login")
    }
    .buttonStyle(.loginButton)
    .padding()
  }

  private var orDivider: some View {
    HStack {
      Rectangle()
        .frame(height: 0.5)

      Text("OR")
        .font(.footnote)
        .fontWeight(.semibold)
      Rectangle()
        .frame(height: 0.5)
    }
    .foregroundColor(.gray)
  }

  private var withFBBTN: some View {
    Button {} label: {
      Text("Continue with facebook")
        .font(.footnote)
        .fontWeight(.semibold)
    }
  }

  private var signUpLink: some View {
    NavigationLink {
      AddEmailView()
    } label: {
      HStack(spacing: 3) {
        Text("Don't have an account?")

        Text("Sign up")
          .fontWeight(.semibold)
      }
      .font(.footnote)
    }
    .padding(.vertical, 16)
  }
}

#Preview {
  LoginView()
}
