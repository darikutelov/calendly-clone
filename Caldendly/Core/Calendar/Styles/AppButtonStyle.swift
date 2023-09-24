//
//  AppButtonStyle.swift
//  Calendly
//
//  Created by Dariy Kutelov on 24.09.23.
//

import Foundation
import SwiftUI

struct AppButtonStyle: ButtonStyle {
    let textColor: Color
    let backgroundColor: Color
    
    init(textColor: Color, backgroundColor: Color) {
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        
        configuration.label
            .frame(maxWidth: .infinity)
            .font(.headline)
            .kerning(1)
            .padding()
            .foregroundStyle(textColor)
            .frame(height: 48)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(textColor == .white ? .clear : textColor)
                    .fill(backgroundColor)
            )
    }
}

extension ButtonStyle where Self == AppButtonStyle {
    static func appButton(textColor: Color, backgroundColor: Color) -> AppButtonStyle {
        AppButtonStyle(
            textColor: textColor,
            backgroundColor: backgroundColor
        )
    }
}
