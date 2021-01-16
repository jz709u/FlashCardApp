//
//  CDFlashCardAnswer+CoreDataProperties.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/15.
//
//

import Foundation
import CoreData


extension CDFlashCardAnswer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFlashCardAnswer> {
        return NSFetchRequest<CDFlashCardAnswer>(entityName: "CDFlashCardAnswer")
    }

    @NSManaged public var answerType: Int16
    @NSManaged public var correct: Bool
    @NSManaged public var associatedQuestion: CDFlashCardQuestion?

}
