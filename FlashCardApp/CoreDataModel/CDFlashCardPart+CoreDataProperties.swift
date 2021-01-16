//
//  CDFlashCardPart+CoreDataProperties.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/15.
//
//

import Foundation
import CoreData


extension CDFlashCardPart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFlashCardPart> {
        return NSFetchRequest<CDFlashCardPart>(entityName: "CDFlashCardPart")
    }

    @NSManaged public var content: String?
    @NSManaged public var order: Int16

}
