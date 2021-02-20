//
//  RocketAPIClient.swift
//  Rockets
//
//  Created by Suto, Evelyne on 20/02/2021.
//

import Alamofire
import Foundation
import UIKit

enum RocketLoaderResult {
    case success([Rocket])
    case failure(Error)
}

protocol RocketAPIClient: class {
    func fetchRockets(lastModified: Date?,
                      progressCallback: @escaping (Progress) -> Void,
                      completion: @escaping (RocketLoaderResult) -> Void)
}
