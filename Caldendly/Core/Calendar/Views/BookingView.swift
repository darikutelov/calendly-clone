//
//  BookingView.swift
//  Calendly
//
//  Created by Dariy Kutelov on 24.09.23.
//

import SwiftUI

struct BookingView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var notes: String = ""
    var currentDate: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            
            //TODO: - Refactor with Grid
            VStack(alignment: .leading, spacing: 20) {
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "clock")
                    Text("30 min")
                }
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "video")
                    Text("FaceTime")
                }
                
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "calendar")
                    Text("\(currentDate.toHoursWeekDayFullDate(meetingDuration: 30))")
                }
                
                HStack {
                    Image(systemName: "arrowtriangle.right.fill")
                        .font(.caption2)
                        .foregroundStyle(Constants.Colors.primary)
                    Text("Description")
                }
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Enter details")
                    .font(.title)
                    .bold()
                
                VStack(alignment: .leading) {
                    Text("Name")
                    TextField("", text: $name)
                        .modifier(TextInput(error: false))
                }
                
                VStack(alignment: .leading) {
                    Text("Email")
                    TextField("", text: $email)
                        .modifier(TextInput(error: false))
                }
                
                Button {
                    
                } label: {
                    Text("Add Guests")
                }
                .buttonStyle(
                    .appButton(
                        textColor: Constants.Colors.secondary,
                        backgroundColor: .clear
                    )
                )
                
                Text("Please, share anything that will prepare for our meeting")
                    .font(.callout)
                    .lineLimit(2)
                
                TextField("", text: $notes, axis: .vertical)
                    .lineLimit(2...4)
                    .modifier(TextInput(error: false))
                  
                Spacer()

                NavigationLink {
                    ConfirmationView()
                } label: {
                    Text("Schedule Event")
                }
                .buttonStyle(
                    .appButton(
                        textColor: .white,
                        backgroundColor: Constants.Colors.primary
                    )
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle("Saturday")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    NavigationStack {
        BookingView(currentDate: Date())
    }
}
