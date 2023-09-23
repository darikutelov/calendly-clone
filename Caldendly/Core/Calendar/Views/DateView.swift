//
//  DateView.swift
//  Calendly
//
//  Created by Dariy Kutelov on 23.09.23.
//

import SwiftUI

struct DateView: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("September 24")
            }
        }
        .navigationTitle("Saturday")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DateView()
    }
}
