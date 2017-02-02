//
//  MommyHelperTests.swift
//  MommyHelperTests
//
//  Created by Priyanka Joshi on 2/1/17.
//  Copyright © 2017 Priyanka Joshi. All rights reserved.
//

import XCTest
@testable import MommyHelper

class MommyHelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: Feed Class Tests
    // Confirm that the Feed initializer returns a Feed object when passed valid parameters.
    func testFeedInitializationSucceeds() {
        // Zero feeds
        let zeroFeeds = Feed.init(numberOfFeeds : 0)
        XCTAssertNotNil(zeroFeeds)
        
        // positive feeds
        let positiveFeeds = Feed.init(numberOfFeeds : 9)
        XCTAssertNotNil(positiveFeeds)
    }
    
    // Confirm that the Feed initialier returns nil when passed a negative feed
    func testFeedInitializationFails() {
        // Negative feeds
        let negativeFeeds = Feed.init(numberOfFeeds : -1)
        XCTAssertNil(negativeFeeds)

    }
}
