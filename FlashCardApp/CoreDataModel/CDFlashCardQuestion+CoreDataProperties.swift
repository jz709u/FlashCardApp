//
//  CDFlashCardQuestion+CoreDataProperties.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/15.
//
//

import Foundation
import CoreData


extension CDFlashCardQuestion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFlashCardQuestion> {
        return NSFetchRequest<CDFlashCardQuestion>(entityName: "CDFlashCardQuestion")
    }

    @NSManaged public var answers: NSSet?
    @NSManaged public var card: CDFlashCard?

}

// MARK: Generated accessors for answers
extension CDFlashCardQuestion {

    @objc(addAnswersObject:)
    @NSManaged public func addToAnswers(_ value: CDFlashCardAnswer)

    @objc(removeAnswersObject:)
    @NSManaged public func removeFromAnswers(_ value: CDFlashCardAnswer)

    @objc(addAnswers:)
    @NSManaged public func addToAnswers(_ values: NSSet)

    @objc(removeAnswers:)
    @NSManaged public func removeFromAnswers(_ values: NSSet)

}
