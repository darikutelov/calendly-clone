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
    
    /// Returns date as September, 2023
    func monthAndYearString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        
        return formatter.string(from: self)
    }
    
    /// Returns date as 09/22/2023
    func dateToStringFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter.string(from: self)
    }

    /// Returns  date as September 9, 2023
    func toFullDateFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        
        return formatter.string(from: self)
    }
    
    /// Returns date as 14:00 AM
    func timeFromDateFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        return formatter.string(from: self)
    }
    
    // Retunrs date as Monday
    func dayOfTheWeek() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        
        return formatter.string(from: self)
    }
    
    // Retunrs date as 10:00AM - 11:00AM, Monday, September 12, 2023
    func toHoursWeekDayFullDate(meetingDuration: Int) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm a"
        let startTimeFormatted = timeFormatter.string(from: self)
        
        let endTime = Calendar.current.date(
            byAdding: .minute,
            value: meetingDuration,
            to: self
        )!
        let endTimeFormatted = timeFormatter.string(from: endTime)
        
        let dayFormatted = self.dayOfTheWeek()
        let dateFormatted = self.toFullDateFormat()
        
        return "\(startTimeFormatted) - \(endTimeFormatted), \(dayFormatted), \(dateFormatted)"
    }
}
