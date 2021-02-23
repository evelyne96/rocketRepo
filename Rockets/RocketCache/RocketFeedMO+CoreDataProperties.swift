//
//  RocketFeedMO+CoreDataProperties.swift
//  Rockets
//
//  Created by Suto, Evelyne on 23/02/2021.
//
//

import Foundation
import CoreData


extension RocketFeedMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RocketFeedMO> {
        return NSFetchRequest<RocketFeedMO>(entityName: "RocketFeed")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var rockets: NSSet?

}

// MARK: Generated accessors for rockets
extension RocketFeedMO {

    @objc(addRocketsObject:)
    @NSManaged public func addToRockets(_ value: RocketMO)

    @objc(removeRocketsObject:)
    @NSManaged public func removeFromRockets(_ value: RocketMO)

    @objc(addRockets:)
    @NSManaged public func addToRockets(_ values: NSSet)

    @objc(removeRockets:)
    @NSManaged public func removeFromRockets(_ values: NSSet)

}

extension RocketFeedMO : Identifiable {

}
