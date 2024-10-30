import SwiftUI

struct BorderedButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .fontWeight(.semibold)
      .frame(maxWidth: .infinity)
      .foregroundColor(.buttonBackground)
      .padding(8)
      .background(
        RoundedRectangle(cornerRadius: 6)
          .stroke(.buttonBackground, lineWidth: 2)
      )
  }
}

extension ButtonStyle where Self == BorderedButton {
  static var borderedButton: Self { Self() }
}

#Preview {
  Button("Click Me") {
    // Button action
  }
  .buttonStyle(.borderedButton)
  .padding()
}
