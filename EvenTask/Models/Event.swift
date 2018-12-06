//
//  Event.swift
//  Archtrials
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class Event: Codable {
    var id: Int
    var title: String
    var description: String
    var priority: Float
    var permanent: Bool
    var tasks: Tasks
    
    init() {
        id = 0
        title = ""
        description = ""
        priority = 0.0
        permanent = false
        tasks = Tasks()
    }
}
