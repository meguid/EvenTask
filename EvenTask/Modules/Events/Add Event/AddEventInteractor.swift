//
//  AddEventInteractor.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation
import Promises

class AddEventInteractor: BaseInteractor {

    var title: String?
    var description: String?
    var priority: Float?
    var permanent: Bool?
    var token: String?
    var userId: Int?
    
    init(_ title: String?, _ description: String?, _ priority: Float?, _ permanent: Bool?, base: BaseInteractor) {
        super.init(network: base.network, location: base.location, cache: base.cache)
        self.title = title
        self.description = description
        self.priority = priority
        self.permanent = permanent
    }
    
    override func extract() {
        token = cache.getObject(Token(), key: .token)?.token
        userId = cache.getObject(User(), key: .user)?.id
    }
    
    override func validate() throws {
        try NotEmpty(value: title, key: .titleField).orThrow()
        try NotOptional(value: description, key: .descriptionField).orThrow()
        try NotEmpty(value: priority, key: .priorityField).orThrow()
        try NotEmpty(value: permanent, key: .permanentField).orThrow()
        try NotEmpty(value: token, key: .tokenField).orThrow()
        try NotEmpty(value: userId, key: .userIDField).orThrow()
    }
    
    override func process<T: Codable>(_ model: T) -> Promise<T> {
        return network.callModel(model: model,
                                 url: URL(string: "/\(userId!)/event")!,
                                 method: "post",
                                 parameters: AddTaskRequest(title: title!,
                                                            description: description!,
                                                            priority: priority!,
                                                            permanent: permanent!).asDictionary(),
                                 headers: ["Authorization": "Bearer \(token!)"])
    }
}
