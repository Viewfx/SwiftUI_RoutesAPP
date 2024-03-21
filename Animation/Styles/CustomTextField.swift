//
//  CustomTextField.swift
//  Animation
//
//  Created by Sergio on 17/1/24.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .padding(.leading, 20)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 9, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 9, style: .continuous).stroke(.opacity(0.1))
        )
    }
}

extension View {
    func customTextField() -> some View {
        modifier(CustomTextField())
    }
}
