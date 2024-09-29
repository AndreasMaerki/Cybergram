//
//  ErrorAlertModifier.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 29.09.2024.
//

import SwiftUI

// Define a view modifier that takes an error and presents an alert
struct ErrorAlertModifier: ViewModifier {
  @Binding var error: Error?

  func body(content: Content) -> some View {
    content
      .alert(isPresented: .init(get: { error != nil }, set: { $0 ? () : (error = nil) })) {
        Alert(
          title: Text("Error"),
          message: Text(error?.localizedDescription ?? ""),
          dismissButton: .default(Text("OK"))
        )
      }
  }
}

extension View {
  func onErrorAlert(_ error: Binding<Error?>) -> some View {
    modifier(ErrorAlertModifier(error: error))
  }
}
