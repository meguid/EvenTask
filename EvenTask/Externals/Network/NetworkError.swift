//
//  NetworkError.swift
//  EvenTask
//
//  Created by Ahmed Meguid on 12/13/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case networkFail(error: String)
    
    var message: String {
        switch self {
        case .networkFail(let error): return "Network failed with \(error)"
        }
    }
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        return self.message
    }
}
