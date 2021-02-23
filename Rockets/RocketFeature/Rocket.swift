//
//  Rocket.swift
//  Rockets
//
//  Created by Suto, Evelyne on 20/02/2021.
//

import Foundation

struct Rocket: Decodable, Hashable {
    let isActive: Bool
    let successRate: Int
    let firstFlightDate: Date
    let costPerLaunch: Int
    let country: String
    let wikipediaURL: URL
    let description: String
    let id: String
    let name: String
    let imageURLs: [URL]
    
    enum CodingKeys: String, CodingKey {
        case isActive = "active"
        case successRate = "success_rate_pct"
        case firstFlightDate = "first_flight"
        case costPerLaunch = "cost_per_launch"
        case country = "country"
        case wikipediaURL = "wikipedia"
        case description = "description"
        case id = "rocket_id"
        case name = "rocket_name"
        case imageURLs = "flickr_images"
    }
}
