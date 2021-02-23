//
//  RocketRecord.swift
//  Rockets
//
//  Created by Suto, Evelyne on 20/02/2021.
//

import Foundation
import UIKit

class RocketRecord {
    let rocket: Rocket
    var rocketImage: UIImage?
    var rocketImageLoadState: DownloadState
    
    init(rocketInfo: Rocket) {
        self.rocket = rocketInfo
        self.rocketImage = nil
        self.rocketImageLoadState = .new
    }
}

//class RocketLoader {
//    let url: URL
//    let client: HTTPClient
    
//    enum RocketLoaderError: Error {
//        case invalidData
//    }
//
//    init(url: URL, client: HTTPClient) {
//        self.client = client
//        self.url = url
//    }
    
//    func fetchRockets(progressCallback: @escaping (Progress) -> Void, completion: @escaping (RocketLoaderResult) -> Void) {
//        let url = self.url
//        client.get(url: url, progressCallback: progressCallback) { (result) in
//            switch result {
//            case .success(let data):
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601)
//                if let rocketList = try? decoder.decode([Rocket].self, from: data) {
//                    completion(.success(rocketList))
//                } else {
//                    completion(.failure(RocketLoaderError.invalidData))
//                }
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//}

//protocol HTTPClient {
//    func get(url: URL, progressCallback: ((Progress) -> Void)?, completion: @escaping (Result<Data, Error>) -> Void)
//}
//
//class AlomofireHTTPClient: HTTPClient {
//    func get(url: URL, progressCallback: ((Progress) -> Void)?, completion: @escaping (Result<Data, Error>) -> Void) {
//        let request = AF.request(url)
//        request.validate(statusCode: 200..<300)
//            .downloadProgress(closure: { (progress) in
//                progressCallback?(progress)
//            }).response { (response) in
//            switch response.result {
//            case .success(let data):
//                guard let data = data else {
//                    completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
//                    return
//                }
//                completion(.success(data))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//}
