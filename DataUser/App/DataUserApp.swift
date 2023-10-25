//
//  DataUserApp.swift
//  DataUser
//
//  Created by Anton Gerasimov on 23.10.2023.
//

import SwiftUI

@main
struct DataUserApp: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
