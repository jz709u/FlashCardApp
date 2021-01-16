//
//  CDFlashCard+CoreDataProperties.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/15.
//
//

import Foundation
import CoreData


extension CDFlashCard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFlashCard> {
        return NSFetchRequest<CDFlashCard>(entityName: "CDFlashCard")
    }

    @NSManaged public var creationDate: Date?
    @NSManaged public var title: String?
    @NSManaged public var updatedDate: Date?
    @NSManaged public var questions: NSSet?

}

// MARK: Generated accessors for questions
extension CDFlashCard {

    @objc(addQuestionsObject:)
    @NSManaged public func addToQuestions(_ value: CDFlashCardQuestion)

    @objc(removeQuestionsObject:)
    @NSManaged public func removeFromQuestions(_ value: CDFlashCardQuestion)

    @objc(addQuestions:)
    @NSManaged public func addToQuestions(_ values: NSSet)

    @objc(removeQuestions:)
    @NSManaged public func removeFromQuestions(_ values: NSSet)

}
