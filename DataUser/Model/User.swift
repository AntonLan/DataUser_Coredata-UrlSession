//
//  User.swift
//  DataUser
//
//  Created by Anton Gerasimov on 23.10.2023.
//

import Foundation

protocol Userable: Identifiable, Codable {
    var isActive: Bool { get }
    var name: String { get }
    var age: Int16 { get }
    var company: String { get }
    var email: String { get }
    var address: String { get }
    var about: String { get }
    var registered: Date { get }
    var tags: [String] { get }
    var friends: [Friend] { get }
}

struct User: Userable {
    var id = UUID()
    var isActive: Bool
    var name: String
    var age: Int16
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}

