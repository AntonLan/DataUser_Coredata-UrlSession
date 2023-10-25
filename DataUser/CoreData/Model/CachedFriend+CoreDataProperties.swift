//
//  CachedFriend+CoreDataProperties.swift
//  DataUser
//
//  Created by Anton Gerasimov on 24.10.2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?
    
    public var wrappedName: String {
        return name ?? "Unknow name"
    }

}

extension CachedFriend : Identifiable {

}
