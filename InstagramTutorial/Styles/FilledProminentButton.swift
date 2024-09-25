//
//  LoginButton 2.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 25.09.2024.
//

import SwiftUI

struct FilledProminentButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(Color(.systemBlue))
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
