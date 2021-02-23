//
//  RocketMO+CoreDataProperties.swift
//  Rockets
//
//  Created by Suto, Evelyne on 23/02/2021.
//
//

import Foundation
import CoreData


extension RocketMO {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RocketMO> {
        return NSFetchRequest<RocketMO>(entityName: "Rocket")
    }

    @NSManaged public var id: String?
    @NSManaged public var active: Bool
    @NSManaged public var successRate: Int64
    @NSManaged public var firstFlightDate: Date?
    @NSManaged public var costPerLaunch: Int64
    @NSManaged public var country: String?
    @NSManaged public var wikipediaURL: URL?
    @NSManaged public var entryDescription: String?
    @NSManaged public var name: String?

}

extension RocketMO : Identifiable {

}
