//
//  Dependency.swift
//  Archtrials
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

typealias Dependencies = [Dependency]

class Dependency: Codable {
    var id: Int
    var title: String
    
    init() {
        id = 0
        title = ""
    }
}
