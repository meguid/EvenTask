//
//  AppleLocationManager.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class AppleLocationManager: LocationProtocol {
    
    func startTracking() {
        
    }
    
    func getCurrentLocation() -> (lat: Double, long: Double) {
        return (30.0, 30.0)
    }
}
