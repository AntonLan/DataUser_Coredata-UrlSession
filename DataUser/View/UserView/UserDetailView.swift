//
//  UserDetailView.swift
//  DataUser
//
//  Created by Anton Gerasimov on 23.10.2023.
//

import SwiftUI

struct UserDetailView: View {
    let user: CachedUser
    
    var body: some View {
        VStack {
            Information(user: user)
            Spacer()
            Spacer()
            
            NavigationLink {
                FriendsView(friend: user.friendArray)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.linkBackground)
                        .shadow(color: .white ,radius: 6)
                    Text("Friends: \(user.wrappedName)")
                        .font(.custom("Helvetica", size: 14))
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
            }
        }
        .padding()
        .background(.gray.opacity(0.4))
    }
}

#Preview {
    MainView()
}
