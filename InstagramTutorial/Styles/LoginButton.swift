//
//  LoginButton.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 03.05.2024.
//

import SwiftUI

struct LoginButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(Color(.systemBlue))
            .cornerRadius(8)
    }
}

extension ButtonStyle where Self == LoginButton {
    static var loginButton: Self { Self() }
}

#Preview {
    Button("Click Me") {
        // Button action
    }
    .buttonStyle(.loginButton)
    .padding()
}
