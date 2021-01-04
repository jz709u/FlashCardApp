//
//  FlashCardAppApp.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/05.
//

import SwiftUI

@main
struct FlashCardAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
