//
//  RouterMock.swift
//  EvenTaskTests
//
//  Created by Ahmed Meguid on 12/13/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit
@testable import EvenTask

enum RoutingAction: Equatable {
    case present(_ view: BaseView)
    case activityStart
    case activityStop
    case dismiss
    case pop
    case segue(_ storyboardId: String, _ viewId: String)
    case alert(_ message: String)
    
    static public func ==(lhs: RoutingAction, rhs: RoutingAction) -> Bool {
        switch (lhs, rhs) {
        case let (.present(a), .present(b)): return a == b
        case let (.alert(a), .alert(b)): return a == b
        case let (.segue(a,c), .segue(b,d)): return a == b && c == d
        case (.activityStart, .activityStart),
             (.activityStop, .activityStop),
             (.dismiss, .dismiss),
             (.pop, .pop):
            return true
        default:
            return false
        }
    }
}

class RouterMock: RouterProtocol {
    
    var actions: [RoutingAction] = []
    
    var presentedView: BaseView!
    
    func present(view: BaseView) {
        actions.append(.present(view))
    }
    
    func startActivityIndicator() {
        actions.append(.activityStart)
    }
    
    func stopActivityIndicator() {
        actions.append(.activityStop)
    }
    
    func dismiss() {
        actions.append(.dismiss)
    }
    
    func pop() {
        actions.append(.pop)
    }
    
    func segue(storyboard: Storyboard) {
        actions.append(.segue(storyboard.storyboard().storyboardId, storyboard.storyboard().viewId))
    }
    
    func alert(title: String, message: String, actions: [(title: String, style: UIAlertAction.Style)]) {
        self.actions.append(.alert(message))
    }
}
