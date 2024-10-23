import SwiftUI

struct CompleteSignupView: View {
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var viewModel: RegistrationViewModel

  @State private var errorMessage = ""
  @State private var showAlert = false

  var body: some View {
    VStack(spacing: 12) {
      Text("Welcome to Instagram, \(viewModel.userName)")
        .font(.title2)
        .fontWeight(.bold)

      Text("Click below to complete registration and start using instagram")
        .modifier(.grayFootnote)
        .multilineTextAlignment(.center)
        .padding(.horizontal)

      Button {
        Task {
          do {
            try await viewModel.createUser()
          } catch {
            errorMessage = error.localizedDescription
            showAlert = true
          }
        }
      } label: {
        Text("Complete sign up")
      }
      .buttonStyle(.loginButton)
      .padding(.horizontal)
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

#Preview {
  CompleteSignupView()
}
