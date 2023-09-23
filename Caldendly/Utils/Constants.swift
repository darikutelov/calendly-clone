//
//  Constants.swift
//  Caldendly
//
//  Created by Dariy Kutelov on 22.09.23.
//

import Foundation
import SwiftUI

struct Constants {
    static let weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    static let dayHours = [
        Date(),
        Calendar.current.date(byAdding: .hour, value: 1, to: Date())!,
        Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
        Calendar.current.date(byAdding: .hour, value: 3, to: Date())!,
        Calendar.current.date(byAdding: .hour, value: 4, to: Date())!
    ]
    
    struct IconNames {
        static let lessThan = "lessthan"
        static let greaterThan = "greaterthan"
    }
    
    struct Colors {
        static let primary = Color.indigo
        static let secondary = Color(UIColor(hexString: "#D74E09"))
    }
}
