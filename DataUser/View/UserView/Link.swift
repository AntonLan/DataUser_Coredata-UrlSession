//
//  Link.swift
//  DataUser
//
//  Created by Anton Gerasimov on 23.10.2023.
//

import SwiftUI

struct Link: View {
    var user: CachedUser
    
    var body: some View {
        NavigationLink {
            UserDetailView(user: user)
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.linkBackground)
                    .shadow(color: .white ,radius: 6)
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.white)
                        .padding(6)
                    
                    VStack(alignment: .leading) {
                        Text("User: \(user.wrappedName)")
                            .font(.headline)
                        Text("Age: \(user.age)")
                            .font(.subheadline)
                    }
                    .foregroundStyle(.white)
                    Spacer()
                }
                .padding([.horizontal, .vertical])
            }
        }
    }
    
}


#Preview {
    MainView()
}
