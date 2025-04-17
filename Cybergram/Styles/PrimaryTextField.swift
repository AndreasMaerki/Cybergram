import SwiftUI

struct PrimaryTextField: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .font(.subheadline)
      .padding(12)
      .background(Color(.systemGray6))
      .cornerRadius(10)
  }
}

extension TextFieldStyle where Self == PrimaryTextField {
  static var primaryTextField: Self { Self() }
}

#Preview {
  TextField("Your name", text: .constant(""))
    .textFieldStyle(.primaryTextField)
    .padding()
}
