//
//  CachedUser+CoreDataProperties.swift
//  DataUser
//
//  Created by Anton Gerasimov on 24.10.2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var company: String?
    @NSManaged public var about: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?
    
    public var wrappedName: String {
        return name ?? "Unknow name"
    }
    
    public var wrappedEmail: String {
        return email ?? "Unknow email"
    }
    
    public var wrappedAddress: String {
        return address ?? "Unknow address"
    }
    
    public var wrappedCompany: String {
        return company ?? "Unknow company"
    }
    
    public var wrappedAbout: String {
        return about ?? "Unknow about"
    }
    
    public var wrappedTags: String {
        return tags ?? ""
    }
    
    public var wrappedRegistered: String {
        return registered?.newFormated ?? Date().newFormated
    }
    
    public var friendArray: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
