//
//  CDBase+CoreDataProperties.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/15.
//
//

import Foundation
import CoreData


extension CDBase {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDBase> {
        return NSFetchRequest<CDBase>(entityName: "CDBase")
    }

    @NSManaged public var tags: CDTag?

}

extension CDBase : Identifiable {

}
