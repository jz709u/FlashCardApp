//
//  FlashCard+Extensions.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/13.
//

import Foundation
import CoreData

extension CDFlashCard {
    
    var orderedQuestions: [CDFlashCardQuestion] {
        (questions?.sortedArray(using: [NSSortDescriptor(keyPath: \CDFlashCardPart.order,
                                                         ascending: true)]) as? [CDFlashCardQuestion]) ?? []
    }
}

extension CDFlashCardQuestion {
    
    var orderedAnswers: [CDFlashCardAnswer] {
        (answers?.sortedArray(using: [NSSortDescriptor(keyPath: \CDFlashCardPart.order,
                                                         ascending: true)]) as? [CDFlashCardAnswer]) ?? []
    }
}
