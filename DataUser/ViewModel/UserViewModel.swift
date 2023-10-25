//
//  UserViewModel.swift
//  DataUser
//
//  Created by Anton Gerasimov on 23.10.2023.
//

import CoreData
import Foundation

final class UserViewModel: ObservableObject {
    @Published var allUsers: [CachedUser] = []
    private var userFriends: [CachedFriend] = []
    
    init() {
        getAllUsers()
    }
    
    func getAllUsers() {
        allUsers = CoreDataManager.shared.getAllUsers()
    }
    
    func addUser(user: User) {
        CoreDataManager.shared.addUser(user: user)
    }
    
    func startApp() {
        allUsers.isEmpty ? loadData() : getAllUsers()
    }
    
    func loadData() {
        Task {
           await fetchData()
        }
    }
    
    func deleteData() {
        allUsers.forEach {
            CoreDataManager.shared.deleteUser(user: $0)
        }
        userFriends.forEach {
            CoreDataManager.shared.deleteFriend(friend: $0)
        }
    }
    
    
    @MainActor
    func fetchData() async {
        guard let url = URL(string: UserDataApi.url) else {
            print(ApiError.invalidUrl)
            return
        }
        var users: [User] = []
        users = await UserDataApi.fetch(url: url)
        users.forEach { (user: User) in
                addUser(user: user)
        }
    }

}
