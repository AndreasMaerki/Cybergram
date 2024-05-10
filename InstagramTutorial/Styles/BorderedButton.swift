//
//  BorderedButton.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 25.04.24.
//

import SwiftUI

struct BorderedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .foregroundColor(.black)
            .padding(8)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.gray, lineWidth: 2)
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
