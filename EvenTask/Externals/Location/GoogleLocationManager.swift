//
//  GoogleLocationManager.swift
//
//  Created by Ahmed Meguid on 12/4/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class GoogleLocationManager: LocationProtocol {
    
    func startTracking() {
        
    }
    
    func getCurrentLocation() -> (lat: Double, long: Double) {
        return (30.0, 30.0)
    }
}
