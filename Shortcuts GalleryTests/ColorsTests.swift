//
//  ColorsTests.swift
//  Shortcuts GalleryTests
//
//  Created by Marco Capano on 26/07/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import XCTest

class ColorsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConsecutiveColorsAreAlwaysDifferents() {
        let first = Colors.random()
        let second = Colors.random()
        
        XCTAssertNotEqual(first, second)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
