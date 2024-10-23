import SwiftUI

struct LoginView: View {
  @State private var errorMessage = ""
  @State private var showAlert = false

  @StateObject var viewModel = LoginViewModel()

  var body: some View {
    NavigationStack {
      VStack {
        Spacer()

        Text("Instagram")
          .font(.title)
          .fontWeight(.bold)
          .italic()

        textFields
          .padding(.horizontal)

        forgotPasswordBTN

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
    }
  }

  private var textFields: some View {
    VStack {
      TextField("Enter your email", text: $viewModel.email)
        .textInputAutocapitalization(.never)

      SecureField("Enter your password", text: $viewModel.password)
    }
    .textFieldStyle(.loginTextField)
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
        .foregroundColor(Color(.systemBlue))
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
