import SwiftUI

struct LoginTextField: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .font(.subheadline)
      .padding(12)
      .background(Color(.systemGray6))
      .cornerRadius(10)
  }
}

extension TextFieldStyle where Self == LoginTextField {
  static var loginTextField: Self { Self() }
}

#Preview {
  TextField("Your name", text: .constant(""))
    .textFieldStyle(.loginTextField)
    .padding()
}
