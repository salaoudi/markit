//
//  MarkitApp.swift
//  Markit
//
//  Created by Zayn on 4/3/22.
//

import SwiftUI

@main
struct MarkitApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
