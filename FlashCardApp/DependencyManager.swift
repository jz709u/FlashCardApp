//
//  DependencyManager.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/13.
//

import Foundation

struct DependencyManager {
    var flashCardFactory: FlashCardFactory = CoreDataFlashCardFactory()
}
