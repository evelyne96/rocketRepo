//
//  ImageDataLoader.swift
//  Rockets
//
//  Created by Suto, Evelyne on 20/02/2021.
//

import Alamofire
import Foundation
import UIKit

class ImageDataLoader: ImageAPIClient {
    static func fetchImage(url: URL,
                           lastModified: Date?,
                           completion: @escaping (ImageLoaderResult) -> Void) -> Request {
        
        let request = AF.request(url, headers: HTTPHeaders.ifModifiedSinceHeaders(for: lastModified))
        request.validate(statusCode: 200..<300).responseData { response in
            switch response.result {
            case .success(let imageData):
                let image = UIImage(data: imageData) ?? UIImage()
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        return request
    }
}
