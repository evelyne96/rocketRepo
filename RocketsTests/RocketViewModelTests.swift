//
//  RocketsTests.swift
//  RocketsTests
//
//  Created by Suto, Evelyne on 20/02/2021.
//

import XCTest
@testable import Rockets

extension XCTestCase {
    func anyRocket(firstFlight: Date = Date(), imageURLs: [URL] = []) -> Rocket {
        return Rocket(isActive: true,
                      successRate: 50,
                      firstFlightDate: Date(),
                      costPerLaunch: 100,
                      country: "US",
                      wikipediaURL: anyURL(), description: "Description", id: "Rcoket", name: "Rcoket", imageURLs: imageURLs)
    }
    
    func anyURL() -> URL {
        return URL(string: "wikipedia.com")!
    }
}

class RocketViewModelTests: XCTestCase {
    
    func testSuccessRateFormatting() {
        let rocket = anyRocket()
        let sut = makeSUT(rocket: rocket)
        
        XCTAssertEqual(sut.successRatePct, "\(rocket.successRate)%")
    }
    
    func testDateFormatting() {
        let date = Date()
        let rocket = anyRocket(firstFlight: date)
        let sut = makeSUT(rocket: rocket)
        
        XCTAssertEqual(sut.firstFlight, DateFormatter.iso8601.string(from: date))
    }
    
    func testCostPerLaunchFormatting() {
        let rocket = anyRocket()
        let sut = makeSUT(rocket: rocket)
        
        XCTAssertEqual(sut.costPerLaunch, "\(rocket.costPerLaunch)$")
    }
    
    func testImageNotReturnedWithEmptyImgURLList() {
        let rocket = anyRocket()
        let sut = makeSUT(rocket: rocket)
        
        XCTAssertEqual(sut.imageURL, nil)
    }
    
    func testFirstImageURLIsReturnedWhenMultipleAvailable() {
        let url = URL(string: "example.com")!
        let rocket = anyRocket(imageURLs: [url, anyURL()])
        let sut = makeSUT(rocket: rocket)
        
        XCTAssertEqual(sut.imageURL, url)
    }
    
    func makeSUT(rocket: Rocket) -> RocketViewModel {
        return RocketViewModel(rocket: rocket)
    }
}
