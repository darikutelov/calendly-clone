//
//  DateView.swift
//  Calendly
//
//  Created by Dariy Kutelov on 23.09.23.
//

import SwiftUI

struct CalendarDayView: View {
    @State var dates = Constants.dayHours
    @State var timeSlotDuration = 30
    @State var selectedTimeSlot: Date?
    var currentDate: Date
    
    var body: some View {
        ScrollView {
            VStack {
                Text(currentDate.toFullDateFormat())
                
                Divider()
                    .padding(.vertical)
                
                Text("Select a Time")
                    .font(.title)
                    .bold()
                
                HStack {
                    Text("Duration:")
                    Text("\(timeSlotDuration)")
                        .foregroundStyle(.gray)
                }
                .padding(.bottom)
                
                ForEach(dates, id: \.self) { timeSlot in
                    HStack {
                        Button {
                            withAnimation {
                                if selectedTimeSlot == timeSlot {
                                    selectedTimeSlot = nil
                                } else {
                                    selectedTimeSlot = timeSlot
                                }
                            }
                        } label: {
                            Text(timeSlot.timeFromDateFormat())
                                .bold()
                                .padding()
                                .foregroundColor(selectedTimeSlot == timeSlot ? .white : .black.opacity(0.8))
                                .frame(maxWidth: .infinity)
                                .background(
                                    ZStack {
                                        if selectedTimeSlot == timeSlot {
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(.gray)
                                        } else {
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Constants.Colors.primary)
                                        }
                                    }
                                )
                        }
                        
                        if selectedTimeSlot == timeSlot {
                            NavigationLink {
                                BookingView(currentDate: currentDate)
                            } label: {
                                Text("Next")
                                    .bold()
                                    .foregroundStyle(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Constants.Colors.primary)
                                    }
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(currentDate.dayOfTheWeek())
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CalendarDayView(currentDate: Date())
    }
}
