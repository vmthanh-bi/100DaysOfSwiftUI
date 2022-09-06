//
//  InstafilterApp.swift
//  Instafilter
//
//  Created by Tony Vu on 11/17/21.
//

import SwiftUI

@main
struct InstafilterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
