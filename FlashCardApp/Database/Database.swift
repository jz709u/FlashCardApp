//
//  Database.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/13.
//

import Foundation

protocol Database: FlashCardDatabase, FlashCardQuestionsDatabase {
    var version: String { get }
}

protocol FlashCardDatabase {
    var flashCards: [FlashCardVM] { get }
}

protocol FlashCardQuestionsDatabase {
    var flashCardParts: [FlashCardQuestionVM] { get }
}
