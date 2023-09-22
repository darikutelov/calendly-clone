//
//  Date+MonthDates.swift
//  Caldendly
//
//  Created by Dariy Kutelov on 21.09.23.
//

import Foundation

extension Date {
    func datesOfMonths(for month: Date) -> [Date] {
        let calendar = Calendar.current
        let monthRange = calendar.range(of: .day, in: .month, for: month)!
        
        let components = calendar.dateComponents([.year, .month], from: month)
        var date = calendar.date(from: components)!
        
        var dates: [Date] = []
        
        for _ in monthRange {
            dates.append(date)
            date = calendar.date(byAdding: .day, value: 1, to: date)!
        }
        
        return dates
    }
    
    
    func monthAndYearString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        
        return formatter.string(from: self)
    }
}
