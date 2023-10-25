//
//  Information.swift
//  DataUser
//
//  Created by Anton Gerasimov on 24.10.2023.
//

import SwiftUI

struct Information: View {
    let user: CachedUser
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: \(user.wrappedName)")
            Text("Registered Date: \(user.wrappedRegistered)")
            Text("Age: \(user.age)")
            Text("Email: \(user.wrappedEmail)")
            Text("Company: \(user.wrappedCompany)")
            Text("Adress: \(user.wrappedAddress)")
            VStack(spacing: 5) {
                Text("About")
                    .font(.largeTitle)
                Text(user.wrappedAbout)
                    .font(.callout)
            }
            .padding(.top, 30)
        }
        .foregroundColor(.linkBackground)
    }
}
