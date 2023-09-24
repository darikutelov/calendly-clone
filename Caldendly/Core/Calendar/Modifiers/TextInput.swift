//
//  TextInput.swift
//  Calendly
//
//  Created by Dariy Kutelov on 24.09.23.
//

import SwiftUI

struct TextInput: ViewModifier {
    var error: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(error ? .red : .black)
            .frame(height: 48)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(error ? .red : .black, lineWidth: 1.0)
            )
    }
}

