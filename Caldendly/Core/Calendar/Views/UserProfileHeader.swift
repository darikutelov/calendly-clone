//
//  UserProfile.swift
//  Caldendly
//
//  Created by Dariy Kutelov on 22.09.23.
//

import SwiftUI

struct UserProfileHeader: View {
    var body: some View {
        VStack {
            Image(.linda)
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
                .clipShape(Circle())
            Text(Constants.userName)
                .font(.title)
                .bold()
        }
    }
}

#Preview {
    UserProfileHeader()
}
