//
//  FriendsView.swift
//  DataUser
//
//  Created by Anton Gerasimov on 23.10.2023.
//

import SwiftUI

struct FriendsView: View {
    var friend: [CachedFriend]
    
    var body: some View {
        List(friend, id: \.id) { friend in
            Text(friend.wrappedName)
                .foregroundStyle(.linkBackground)
                .listRowBackground(Color.gray.opacity(0))
        }
        .listStyle(.plain)
        .background(.gray.opacity(0.4))
    }
}

#Preview {
    MainView()
}
