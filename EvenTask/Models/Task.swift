//
//  Task.swift
//  Archtrials
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

typealias Tasks = [Task]

class Task: Codable {
    var id: Int
    var title: String
    var dependencies: Dependencies
    init() {
        id = 0
        title = ""
        dependencies = Dependencies()
    }
}
