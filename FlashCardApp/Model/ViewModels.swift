//
//  ViewModels.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/13.
//

import Foundation
import CoreData

struct FlashCardVM: Identifiable {
    let id = UUID()
    let questions: [QuestionType]
}

struct FlashCardQuestionVM: Identifiable, QuestionType {
    let id = UUID()
    var answer: AnswerType
    var hints: [HintType]
    var question: String
}

protocol CardPartType {
    var isNormalType: Bool { get }
}

extension CardPartType {
    var isNormalType: Bool {
        if type(of: self) == QuestionType.self || type(of: self) == HintType.self || type(of: self) == SingleAnswerType.self {
            return true
        }
        return false
    }
}

protocol QuestionType: CardPartType {
    var question: String { get }
    var answer: AnswerType { get }
    var hints: [HintType] { get }
}

extension QuestionType {
    var isNormalType: Bool { true }
}

protocol AnswerType: CardPartType {
    
}

extension AnswerType {
    var isNormalType: Bool { true }
}


protocol HintType: CardPartType {
    var hint: String { get }
}

extension HintType {
    var isNormalType: Bool { true }
}

protocol MultiAnswerType: AnswerType {
    
}

protocol SingleAnswerType: AnswerType {
    var content: String { get }
}

protocol TextAnswerType: AnswerType {
    
}

struct FlashCardAnswerVM: Identifiable {
    
    enum AnswerType {
        case single(String), multi([String]), text(String)
    }

    let id = UUID()
    let content: String
    let answerType: AnswerType
}



struct FlashCardHintVM: Identifiable {
    
    let id = UUID()
    let content: String
}
