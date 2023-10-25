//
//  MainView.swift
//  DataUser
//
//  Created by Anton Gerasimov on 23.10.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = UserViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(vm.allUsers, id: \.id) { user in
                        Link(user: user)
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .background(.gray.opacity(0.4))
            .navigationTitle("List of User")
            .onAppear(perform: vm.startApp)
        }
    }
}

#Preview {
    MainView()
}
