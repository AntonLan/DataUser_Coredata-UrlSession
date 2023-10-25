//
//  FormatedDate.swift
//  DataUser
//
//  Created by Anton Gerasimov on 25.10.2023.
//

import Foundation

extension Date {
    var newFormated: String {
        formatted(date: .abbreviated, time: .omitted)
    }
}
