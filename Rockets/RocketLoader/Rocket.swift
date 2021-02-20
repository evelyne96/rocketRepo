//
//  Rocket.swift
//  Rockets
//
//  Created by Suto, Evelyne on 20/02/2021.
//

import Foundation

struct Rocket: Decodable {
    let entryId: Int
    let active: Bool
    let successRate: Int
    let firstFlight: Date
    let costPerLaunch: Int
    let country: String
    let wikipediaURL: URL
    let description: String
    let id: String
    let name: String
    let imageURLs: [URL]
    
    enum CodingKeys: String, CodingKey {
        case entryId = "id"
        case active = "active"
        case successRate = "success_rate_pct"
        case firstFlight = "first_flight"
        case costPerLaunch = "cost_per_launch"
        case country = "country"
        case wikipediaURL = "wikipedia"
        case description = "description"
        case id = "rocket_id"
        case name = "rocket_name"
        case imageURLs = "flickr_images"
    }
}
