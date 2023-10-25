//
//  CoreDataManager.swift
//  DataUser
//
//  Created by Anton Gerasimov on 24.10.2023.
//

import CoreData
import Foundation

final class CoreDataManager: ObservableObject {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        // pass the data model filename to NSPersistentContainer initializer
        persistentContainer = NSPersistentContainer(name: "UserData")
        
        // load any persistent stores
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
        persistentContainer.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
    
    // save the changes on your context to the persistent store
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    func getAllUsers() -> [CachedUser] {
        let request = NSFetchRequest<CachedUser>(entityName: "CachedUser")
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    
    func getAllFriend() -> [CachedFriend] {
        let request = NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    // add new user by creating a new variable and set the CashedUser context
    // to our viewcontext, assign the data and don't forget to save the
    // changes using saveContext function
    func addUser(user: User) {
        user.friends.forEach { friend in
            let newFriend = CachedFriend(context: viewContext)
            newFriend.id = UUID()
            newFriend.name = friend.name
            newFriend.user = CachedUser(context: viewContext)
            newFriend.user?.id = user.id
            newFriend.user?.name = user.name
            newFriend.user?.age = user.age
            newFriend.user?.email = user.email
            newFriend.user?.address = user.address
            newFriend.user?.company = user.company
            newFriend.user?.about = user.about
            newFriend.user?.isActive = user.isActive
            newFriend.user?.registered = user.registered
            newFriend.user?.tags = user.tags.joined(separator: ",")
            saveContext()
        }
    }
    
    
    func deleteUser(user: CachedUser) {
        viewContext.delete(user)
        saveContext()
    }
    
    func deleteFriend(friend: CachedFriend) {
        viewContext.delete(friend)
        saveContext()
    }
    
}
