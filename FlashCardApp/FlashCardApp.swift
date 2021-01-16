//
//  FlashCardAppApp.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/05.
//

import SwiftUI
import CoreData

@main
struct FlashCardApp: App {
    @StateObject var flashCardStorage: FlashCardStorage = FlashCardStorage(database: FlashCardCoreDataDatabase(inMemory: true))
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomePageView().environmentObject(flashCardStorage)
            }
        }
    }
}

class FlashCardStorage: NSObject, ObservableObject {
    @Published var flashCards: [FlashCardVM]
    
    let db: Database
    
    init(database:Database) {
        self.flashCards = []
        self.db = database
        super.init()
    }
}
