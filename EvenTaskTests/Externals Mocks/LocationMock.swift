//
//  LocationMock.swift
//  EvenTaskTests
//
//  Created by Ahmed Meguid on 12/13/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation
@testable import EvenTask

class LocationMock: LocationProtocol {
    
    var trackingStarted: Bool = false
    var location = (lat: 0.0, long: 0.0)
    func startTracking() {
        trackingStarted = true
    }
    
    func getCurrentLocation() -> (lat: Double, long: Double) {
        return location
    }
}
