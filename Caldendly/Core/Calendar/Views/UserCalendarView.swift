//
//  ContentView.swift
//  Caldendly
//
//  Created by Dariy Kutelov on 21.09.23.
//

import SwiftUI

struct UserCalendarView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(UIColor.secondarySystemBackground)
                    .ignoresSafeArea()
                
                VStack {
                    UserProfileHeader()
                    
                    Divider()
                    
                    CalendarMonthView()
                }
                .padding()
            }
        }
    }
}

#Preview {
    UserCalendarView()
}

