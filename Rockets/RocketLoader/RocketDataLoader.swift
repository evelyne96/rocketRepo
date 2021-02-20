//
//  RocketLoader.swift
//  Rockets
//
//  Created by Suto, Evelyne on 20/02/2021.
//

import Foundation
import Alamofire
import UIKit

extension HTTPHeaders {
    static func lastModifiedHeaders(for lastModified: Date?) -> HTTPHeaders? {
        return lastModified != nil ? HTTPHeaders([HTTPHeader(name: "last-modified", value: lastModified!.description)]) : nil
    }
}

class RocketDataLoader: RocketAPIClient {
    let url: URL
    init(url: URL) {
        self.url = url
    }
    
    func fetchRockets(lastModified: Date?,
                      progressCallback: @escaping (Progress) -> Void,
                      completion: @escaping (RocketLoaderResult) -> Void) {
        
        let request = AF.request(url, headers: HTTPHeaders.lastModifiedHeaders(for: lastModified))
        request.validate(statusCode: 200..<300)
        .downloadProgress(closure: { (progress) in
            progressCallback(progress)
        }).responseDecodable(of: [Rocket].self, decoder: jsonDecoder()) { response in
            switch response.result {
            case .success(let rocketList):
                completion(.success(rocketList))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

fileprivate extension RocketDataLoader {
    func jsonDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601)
        return decoder
    }
}
