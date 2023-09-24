//
//  MonthNavigationButton.swift
//  Calendly
//
//  Created by Dariy Kutelov on 22.09.23.
//

import SwiftUI

enum ToMonth {
    case prev, next
}

struct ChangeMonthButton: View {
    let iconName: String
    let toMonth: ToMonth
    @Binding var selectedMonth: Int
    
    var body: some View {
        Button {
            withAnimation {
                switch toMonth {
                case .prev:
                    selectedMonth -= 1
                case .next:
                    selectedMonth += 1
                }
            }
        } label: {
            Image(systemName: iconName)
                .resizable()
                .scaledToFill()
                .frame(width: 16, height: 16)
                .foregroundColor(Constants.Colors.secondary)
                .background {
                    Circle()
                        .fill(Constants.Colors.secondary.opacity(0.3))
                        .frame(width: 48, height: 48)
                }
            
        }
    }
}

#Preview {
    ChangeMonthButton(
        iconName: Constants.IconNames.lessThan,
        toMonth: .next,
        selectedMonth: .constant(0)
    )
}
