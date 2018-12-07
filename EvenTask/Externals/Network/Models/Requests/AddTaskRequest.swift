//
//  AddTaskRequest.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

class AddTaskRequest: Codable {
    
    var title: String
    var description: String
    var priority: Float
    var permanent: Bool
    
    init(title: String, description: String, priority: Float, permanent: Bool) {
        self.title = title
        self.description = description
        self.priority = priority
        self.permanent = permanent
    }
}
