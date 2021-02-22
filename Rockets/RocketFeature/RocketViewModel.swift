//
//  RocketViewModel.swift
//  Rockets
//
//  Created by Suto, Evelyne on 22/02/2021.
//

import Foundation
import UIKit

enum DownloadState {
    case new
    case inProgress
    case downloaded
    case failed
}

class RocketViewModel: ObservableObject {
    private let rocket: Rocket
    @Published var image = UIImage()
    @Published var imageDownloadstate: DownloadState = .new
    
    init(rocket: Rocket) {
        self.rocket = rocket
    }
    
    var name: String {
        return rocket.name
    }
    
    var successRatePct: String {
        return "\(rocket.successRate)%"
    }
    
    var firstFlight: String {
        return DateFormatter.iso8601.string(from: rocket.firstFlight)
    }
    
    var description: String {
        return rocket.description
    }
    
    var country: String {
        return rocket.country
    }
    
    var costPerLaunch: String {
        return "\(rocket.costPerLaunch)$"
    }
    
    var imageURL: URL? {
        return rocket.imageURLs.first
    }
}

extension RocketViewModel: Hashable {
    static func == (lhs: RocketViewModel, rhs: RocketViewModel) -> Bool {
        return lhs.rocket.id == rhs.rocket.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(rocket.id)
    }
}
