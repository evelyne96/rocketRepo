//
//  RocketListViewModelTest.swift
//  RocketsTests
//
//  Created by Suto, Evelyne on 24/02/2021.
//

import XCTest

class RocketListViewModelTest: XCTestCase {
    
    func testLoadRequestDataFromURL() {
        let (loaderClient, _, sut) = makeSUT()
        sut.fetchRocketsData()
        XCTAssertEqual(loaderClient.requestedURLs, [anyURL()])
    }
    
    func makeSUT() -> (RocketAPIClientSpy, RocketCacheClientSpy, RocketListViewModel) {
        let loader = RocketAPIClientSpy(url: anyURL())
        let cache = RocketCacheClientSpy()
        return (loader, cache,  RocketListViewModel(rocketAPI: loader, cacheAPI: cache))
    }
}


class RocketAPIClientSpy: RocketAPIClient {
    let url: URL
    init(url: URL) {
        self.url = url
    }
    
    var messages: [(url: URL, completion: (RocketLoaderResult) -> Void)] = []
    var requestedURLs: [URL] {
        return messages.map{ $0.url }
    }
    
    func fetchRockets(lastModified: Date?,
                      progressCallback: @escaping (Progress) -> Void,
                      completion: @escaping (RocketLoaderResult) -> Void) {
        messages.append((self.url, completion))
    }
    
    func completeWithSuccess(rockets: [Rocket], index: Int = 0) {
        messages[index].completion(.success(rockets))
    }
    
    func completeWithError(error: Error, index: Int = 0) {
        messages[index].completion(.failure(anyNSError()))
    }
    
    func anyNSError() -> NSError {
        return NSError(domain: "any error", code: 0)
    }
}

class RocketCacheClientSpy: RocketCacheClient {
    var cachedRockets: [Rocket] = []
    var timestamp: Date?

    func deleteCache() {
        cachedRockets = []
        timestamp = nil
    }
    
    func cacheRockets(rockets: [Rocket], timestamp: Date) {
        cachedRockets = rockets
        self.timestamp = timestamp
    }
    
    func fetchRockets() -> (rockets: [Rocket], timestamp: Date) {
        return (cachedRockets, timestamp ?? Date())
    }
}
