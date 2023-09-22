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
                    Button {
                        withAnimation {
                            viewModel.selectedMonth -= 1
                        }
                    } label: {
                        Image(systemName: Constants.iconNames.lessThan)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 16, height: 28)
                            .foregroundColor(.gray)
                    }
                    
                    Text(viewModel.selectedDate.monthAndYearString())
                        .font(.title2)
                    
                    Button {
                        withAnimation {
                            viewModel.selectedMonth += 1
                        }
                    } label: {
                        Image(systemName: Constants.iconNames.greaterThan)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 16, height: 28)
                            .foregroundColor(.gray)
                    }
                }
            }
            
            Grid(horizontalSpacing: 24) {
                GridRow {
                    ForEach(Constants.weekDays, id: \.self) { day in
                        Text(day)
                            .font(.system(size: 12, weight: .medium))
                    }
                }
            }
            
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible()), count: 7),
                spacing: 20
            ) {
               ForEach(viewModel.fetchDates()) { value in
                   ZStack {
                       if value.day != -1 {
                           Text("\(value.day)")
                       } else {
                           Text("")
                       }
                   }
                   .frame(width: 32, height: 32)
                }
            }
        }
        .onChange(of: viewModel.selectedMonth) {_, _ in
            viewModel.selectedDate = viewModel.fetchSelectedMonth()
        }
    }
}

#Preview {
    CalendarView()
}
