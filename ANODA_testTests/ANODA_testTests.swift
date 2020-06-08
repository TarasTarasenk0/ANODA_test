//
//  ANODA_testTests.swift
//  ANODA_testTests
//
//  Created by md760 on 05.06.2020.
//  Copyright © 2020 md760. All rights reserved.
//

import XCTest
@testable import ANODA_test

class ANODA_testTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testHomeViewModel() {
        let homeData = HomeViewModel.HomeData()
        XCTAssertNotEqual(homeData.photoImages, nil)
        XCTAssertNotEqual(homeData.userName, nil)
        XCTAssertNotEqual(homeData.time, nil)
    }
}
