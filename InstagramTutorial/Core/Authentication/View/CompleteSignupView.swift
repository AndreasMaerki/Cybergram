import SwiftUI

struct CompleteSignupView: View {
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var viewModel: RegistrationViewModel

  @State private var errorMessage = ""
  @State private var showAlert = false

  var body: some View {
    VStack(spacing: 12) {
      Image(.cyberBrain)
        .resizable()
        .scaledToFit()
        .foregroundStyle(Color.primaryForeground)
        .padding(.horizontal, 24)
        .padding(.top, 48)
      Spacer()
      Text("Welcome to Cybergram, \(viewModel.userName)")
        .font(.title2)
        .fontWeight(.bold)

      Text("Click below to complete registration and start using Cybergram")
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
      .padding()
    }
    .background(
      Color.primaryBackground
    )
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
    .environmentObject(RegistrationViewModel())
    .preferredColorScheme(.dark)
}
