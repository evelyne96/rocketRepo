//
//  ImageAPIClient.swift
//  Rockets
//
//  Created by Suto, Evelyne on 20/02/2021.
//

import Alamofire
import Foundation
import UIKit

enum ImageLoaderResult {
    case success(UIImage)
    case failure(Error)
}

protocol ImageAPIClient: class {
    static func fetchImage(url: URL,
                           lastModified: Date?,
                           completion: @escaping (ImageLoaderResult) -> Void) -> Request
}
