//
//  CustomTextStyles.swift
//  InstagramTutorial
//
//  Created by Andreas Maerki on 03.05.2024.
//

import SwiftUI

struct GrayFootnote: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.footnote)
            .foregroundStyle(.gray)
    }
}

extension ViewModifier where Self == GrayFootnote {
    static var grayFootnote: Self { Self() }
}

struct BoldGrayFootnote: ViewModifier {
    func body(content: Content) -> some View {
        content
            .modifier(.grayFootnote)
            .bold()
    }
}

extension ViewModifier where Self == BoldGrayFootnote {
    static var boldGrayFootnote: Self { Self() }
}

#Preview {
    Group {
        Text("I'm a footnote")
            .modifier(.grayFootnote)

        Text("I'm a bold footnote")
            .modifier(.boldGrayFootnote)
    }
}
