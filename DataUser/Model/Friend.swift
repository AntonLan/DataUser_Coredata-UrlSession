//
//  Friend.swift
//  DataUser
//
//  Created by Anton Gerasimov on 23.10.2023.
//

import Foundation

protocol Friendable: Identifiable, Codable {
    var name: String { get }
}

struct Friend: Friendable {
    var id = UUID()
    var name: String
}
