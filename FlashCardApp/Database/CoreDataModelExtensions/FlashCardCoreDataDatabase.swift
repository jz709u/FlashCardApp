//
//  FlashCardCoreDataDatabase.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/13.
//

import Foundation
import CoreData

class FlashCardCoreDataDatabase: NSObject, Database {

    var version: String = "0.0.0"
    var flashCards: [FlashCardVM] = []
    var flashCardParts: [FlashCardQuestionVM] = []
    
    let container: NSPersistentCloudKitContainer
    let flashCardsFetchController: NSFetchedResultsController<CDFlashCard>

    init(inMemory: Bool = false) {
        
        container = NSPersistentCloudKitContainer(name: "FlashCardApp")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        let request: NSFetchRequest<CDFlashCard> = CDFlashCard.fetchRequest()
        flashCardsFetchController = NSFetchedResultsController(fetchRequest: request,
                                                               managedObjectContext: container.viewContext,
                                                               sectionNameKeyPath: nil,
                                                               cacheName: nil)
        super.init()
        
        flashCardsFetchController.delegate = self
        
        do {
            try flashCardsFetchController.performFetch()
            let _flashCards = flashCardsFetchController.fetchedObjects ?? []
            //flashCards = _flashCards.map( { FlashCardVM(cdFlashCard: $0) })
        } catch {
            
        }
    }
    
    private func fetchItems(sortDescriptors: [NSSortDescriptor]) -> [CDFlashCard] {
        flashCardsFetchController.fetchRequest.sortDescriptors = sortDescriptors
        
        do {
            try flashCardsFetchController.performFetch()
            flashCardsFetchController.fetchedObjects ?? []
        } catch {
            
        }
        //flashCardsFetchController.sortDescriptors = sortDescriptors

        return []
    }

    private func addItem() {
        
        let newItem = CDFlashCard(context: container.viewContext)
        //newItem.timestamp = Date()

        do {
            try container.viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }

    private func deleteItems(flashCards: [FlashCardVM]) {
        
        //flashCards
      
        //offsets.map { flashCards[$0] }.forEach(container.viewContext.delete)

        do {
            try container.viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
    }
}

extension FlashCardCoreDataDatabase: NSFetchedResultsControllerDelegate {
    
}
