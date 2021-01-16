//
//  CDTag+CoreDataProperties.swift
//  FlashCardApp
//
//  Created by Jay Zisch on 2021/01/15.
//
//

import Foundation
import CoreData


extension CDTag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTag> {
        return NSFetchRequest<CDTag>(entityName: "CDTag")
    }

    @NSManaged public var name: String?
    @NSManaged public var type: Int16
    @NSManaged public var associatedBaseCard: NSSet?

}

// MARK: Generated accessors for associatedBaseCard
extension CDTag {

    @objc(addAssociatedBaseCardObject:)
    @NSManaged public func addToAssociatedBaseCard(_ value: CDBase)

    @objc(removeAssociatedBaseCardObject:)
    @NSManaged public func removeFromAssociatedBaseCard(_ value: CDBase)

    @objc(addAssociatedBaseCard:)
    @NSManaged public func addToAssociatedBaseCard(_ values: NSSet)

    @objc(removeAssociatedBaseCard:)
    @NSManaged public func removeFromAssociatedBaseCard(_ values: NSSet)

}

extension CDTag : Identifiable {

}
