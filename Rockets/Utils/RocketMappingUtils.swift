//
//  RocketMappingUtils.swift
//  Rockets
//
//  Created by Suto, Evelyne on 23/02/2021.
//

import Foundation

class RocketMappingUtils {
    static func mapToRocket(rocketMO: RocketMO) -> Rocket? {
        return Rocket(isActive: rocketMO.active,
                      successRate: Int(rocketMO.successRate),
                      firstFlightDate: rocketMO.firstFlightDate ?? Date(),
                      costPerLaunch: Int(rocketMO.costPerLaunch),
                      country: rocketMO.country ?? "",
                      wikipediaURL: rocketMO.wikipediaURL ?? URL(string: "wikipedia.com")!,
                      description: rocketMO.entryDescription ?? "",
                      id: rocketMO.id ?? "",
                      name: rocketMO.name ?? "",
                      imageURLs: [])
    }
    
    static func setRocketMOProperties(rocketMO: RocketMO, with rocket: Rocket) -> RocketMO {
        rocketMO.active = rocket.isActive
        rocketMO.successRate = Int64(rocket.successRate)
        rocketMO.firstFlightDate = rocket.firstFlightDate
        rocketMO.costPerLaunch = Int64(rocket.costPerLaunch)
        rocketMO.country = rocket.country
        rocketMO.entryDescription = rocket.description
        rocketMO.id = rocket.id
        rocketMO.name = rocket.name
        rocketMO.wikipediaURL = rocket.wikipediaURL
        
        return rocketMO
    }
}
