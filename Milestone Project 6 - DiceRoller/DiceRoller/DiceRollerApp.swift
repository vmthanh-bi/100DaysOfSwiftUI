//
//  DiceRollerApp.swift
//  DiceRoller
//
//  Created by Tony Vu on 10/4/22.
//

import SwiftUI

@main
struct DiceRollerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
