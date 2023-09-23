//
//  CalendarDate.swift
//  Calendly
//
//  Created by Dariy Kutelov on 23.09.23.
//

import SwiftUI

struct CalendarDay: View {
    let date: CalendarDate
    
    var body: some View {
        Text("\(date.day)")
            .foregroundColor(date.day % 2 != 0 ? .blue : .black)
            .fontWeight(date.day % 2 != 0 ? .bold : .none)
            .background {
                ZStack(alignment: .bottom) {
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(date.day % 2 != 0 ? .blue.opacity(0.1) : .clear)
                    
                    if date.date.dateToString() == Date().dateToString() {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(date.day % 2 != 0 ? .blue : .gray)
                    }
                }
            }    }
}

#Preview {
    CalendarDay(date: CalendarDate(day: 1, date: Date()))
}
