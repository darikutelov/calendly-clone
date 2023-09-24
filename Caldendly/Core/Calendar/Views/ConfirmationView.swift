//
//  ConfirmationView.swift
//  Calendly
//
//  Created by Dariy Kutelov on 24.09.23.
//

import SwiftUI

struct ConfirmationView: View {
    var body: some View {
        VStack {
            Image("Linda")
                .resizable()
                .scaledToFill()
                .frame(width: 128, height: 128)
                .cornerRadius(64)
            
            Text("Confirmed")
                .font(.title)
                .bold()
                .padding()
            
            Text("You are scheduled with Linda")
            
            Divider()
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Circle()
                        .frame(width: 24, height: 24)
                        .foregroundColor(Constants.Colors.primary)
                    
                    Text("Meeting with Jason")
                }
                
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "video")
                    Text("FaceTime")
                }
                
                HStack(alignment: .firstTextBaseline) {
                    Image(systemName: "calendar")
                    Text("10:00 - 11:00 AM, Monday, September 25th 2023")
                }
            }
            .padding(.vertical)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Done")
            }
            .buttonStyle(
                .appButton(
                    textColor: .white,
                    backgroundColor: Constants.Colors.primary
                ))
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}

#Preview {
    NavigationStack {
        ConfirmationView()
    }
}
