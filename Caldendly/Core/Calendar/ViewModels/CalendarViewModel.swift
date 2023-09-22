//
//  CalendarViewViewModel.swift
//  Caldendly
//
//  Created by Dariy Kutelov on 22.09.23.
//

import SwiftUI
import Foundation

class CalendarViewModel: ObservableObject {
    @Published var selectedMonth = 0
    @Published var selectedDate = Date()
    
    func fetchDates() -> [CalendarDate] {
        let calendar = Calendar.current
        let currentMonth = fetchSelectedMonth()
        
        var days = currentMonth.datesOfMonths(for: currentMonth)
            .map {
                CalendarDate(
                    day: calendar.component(.day, from: $0),
                    date: $0
                )
            }
        
        let firstDayOfWeek = calendar.component(.weekday, from: days.first?.date ?? Date())
        for _ in 0..<firstDayOfWeek - 1 {
            days.insert(CalendarDate(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
    func fetchSelectedMonth() -> Date {
        let calendar = Calendar.current
        let month = calendar
            .date(byAdding: .month, value: selectedMonth, to: Date())
        
        guard let timesnapshot = month else { return Date()}
        
        return timesnapshot
    }
}
