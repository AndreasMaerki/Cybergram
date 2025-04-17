import SwiftUI

struct FilledProminentButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.subheadline)
      .fontWeight(.semibold)
      .foregroundStyle(.white)
      .frame(maxWidth: .infinity)
      .frame(height: 40)
      .background(Color.buttonBackground)
      .cornerRadius(8)
  }
}

extension ButtonStyle where Self == FilledProminentButton {
  static var filledProminentButton: Self { Self() }
}

#Preview {
  Button("Click Me") {
    // Button action
  }
  .buttonStyle(.filledProminentButton)
  .padding()
}
