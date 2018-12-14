//
//  BaseModuleTests.swift
//  EvenTaskTests
//
//  Created by Ahmed Meguid on 12/13/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import XCTest
@testable import EvenTask

class BaseModuleTests: XCTestCase {
    
    var cache: CacheMock!
    var network: NetworkMock!
    var location: LocationMock!
    var router: RouterMock!
    
    override func setUp() {
        cache = CacheMock()
        location = LocationMock()
        router = RouterMock()
        network = NetworkMock()
    }
    
    func assertRouterError(_ error: Error) {
        let expectedError = error.localizedDescription
        XCTAssertEqual(router.actions.count, 1)
        XCTAssertEqual(router.actions[0], .alert(expectedError))
    }
}
