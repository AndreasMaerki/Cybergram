import SwiftUI

struct CyberBrainDrawingView: View {
  @State private var startDrawing = false
  private let spinnerSize: Double = 400
  private let strokeColor = Color.primaryForeground
  private let lineWidth: Double = 2
  private let animationTime: Double = 3.5

  var body: some View {
    CyberBrainShape()
      .trim(from: startDrawing ? 0 : 1, to: 1)
      .stroke(
        strokeColor,
        style: StrokeStyle(
          lineWidth: lineWidth,
          lineCap: .round,
          lineJoin: .round
        )
      )
      .onAppear {
        withAnimation(.easeInOut(duration: animationTime)) {
          startDrawing = true
        }
      }
  }
}

#Preview {
  CyberBrainDrawingView()
}
