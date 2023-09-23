//
//  ContentView.swift
//  Caldendly
//
//  Created by Dariy Kutelov on 21.09.23.
//

import SwiftUI

enum Period: String {
    case week, month
}

struct UserCalendarView: View {
    @State var period: Period = .month
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(UIColor.secondarySystemBackground)
                    .ignoresSafeArea()
                
                VStack {
                    UserProfileHeader()
                    
                    Divider()
                    
                    Text(Constants.selectADayText)
                        .font(.title2)
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        ChangePeriodButton(
                            currentPeriod: .week,
                            period: $period
                        )
                        ChangePeriodButton(
                            currentPeriod: .month,
                            period: $period
                        )
                    }
                    .padding(.bottom)
                    
                    switch period {
                    case .month:
                        CalendarMonthView()
                    case .week:
                        CalendarWeeklyView()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    UserCalendarView()
}


struct ChangePeriodButton: View {
    let currentPeriod: Period
    @Binding var period: Period
    var isCurrent: Bool {
        currentPeriod == period
    }
    
    var body: some View {
        Button {
            switch currentPeriod {
            case .week:
                withAnimation {
                    period = .week
                }
            case .month:
                withAnimation {
                    period = .month
                }
            }
        } label: {
            Text(currentPeriod.rawValue.uppercased())
                .foregroundStyle(isCurrent ? .white : Constants.Colors.secondary)
                .padding(.vertical, 8)
                .frame(width: 80)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isCurrent ? Constants.Colors.secondary : .clear)
                        .stroke(isCurrent ? .clear : Constants.Colors.secondary)
                )
        }
    }
}
