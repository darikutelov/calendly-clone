//
//  Calendar.swift
//  Caldendly
//
//  Created by Dariy Kutelov on 22.09.23.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var viewModel = CalendarViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
                Text(Constants.selectADayText)
                    .font(.title2)
                    .bold()
                
                Grid(horizontalSpacing: 48) {
                    GridRow {
                        ChangeMonthButton(
                            iconName: Constants.iconNames.lessThan,
                            toMonth: .prev,
                            selectedMonth: $viewModel.selectedMonth
                        )
                        
                        Text(viewModel.selectedDate.monthAndYearString())
                            .font(.title2)
                        
                        ChangeMonthButton(
                            iconName: Constants.iconNames.greaterThan,
                            toMonth: .next,
                            selectedMonth: $viewModel.selectedMonth
                        )
                    }
                }
                .padding(.bottom, 32)
            
            Grid(horizontalSpacing: 24) {
                GridRow {
                    ForEach(Constants.weekDays, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 16, weight: .medium))
                    }
                }
            }
            .padding(.bottom, 8)
            
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible()), count: 7),
                spacing: 20
            ) {
               ForEach(viewModel.fetchDates()) { value in
                   ZStack {
                       if value.day != -1 {
                           Text("\(value.day)")
                               .foregroundColor(value.day % 2 != 0 ? .blue : .black)
                               .fontWeight(value.day % 2 != 0 ? .bold : .none)
                               .background {
                                   ZStack(alignment: .bottom) {
                                       Circle()
                                           .frame(width: 48, height: 48)
                                           .foregroundColor(value.day % 2 != 0 ? .blue.opacity(0.1) : .clear)
                                       
                                       if value.date.dateToString() == Date().dateToString() {
                                           Circle()
                                               .frame(width: 8, height: 8)
                                               .foregroundColor(value.day % 2 != 0 ? .blue : .gray)
                                       }
                                   }
                               }
                       } else {
                           Text("")
                       }
                   }
                   .frame(width: 32, height: 32)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .onChange(of: viewModel.selectedMonth) {_, _ in
            viewModel.selectedDate = viewModel.fetchSelectedMonth()
        }
    }
}

#Preview {
    CalendarView()
}
