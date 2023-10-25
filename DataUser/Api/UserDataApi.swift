//
//  UserDataApi.swift
//  DataUser
//
//  Created by Anton Gerasimov on 23.10.2023.
//

import Foundation

final class UserDataApi {
    
    static let url = "https://www.hackingwithswift.com/samples/friendface.json"
    
    static func fetch(url: URL) async -> [User] {
        var result: [User] = []
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                result = decodedResponse
            }
        } catch {
            print(ApiError.invalidData)
        }
        return result
    }
}
