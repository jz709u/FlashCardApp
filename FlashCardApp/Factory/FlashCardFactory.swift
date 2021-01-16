//
//  FlashCardFactory.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/13.
//

import Foundation
import CoreData

protocol FlashCardFactory {
}

struct CoreDataFlashCardFactory: FlashCardFactory {
}


protocol FlashCardPartFactory {
    
}

struct FlashCardPartFactoryDefault: FlashCardPartFactory {
    
}
