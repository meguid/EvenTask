//
//  Storyboard.swift
//  EvenTask
//
//  Created by Ahmed Ramy on 12/7/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

public enum Storyboard {
    case events(view: ViewIdentifier)

    public func viewController(bundle: Bundle? = nil) -> UIViewController {
        return UIStoryboard(name: self.storyboard().storyboardId , bundle: bundle)
            .instantiateViewController(withIdentifier: self.storyboard().viewId)
    }
    
    public func storyboard() -> (storyboardId: String, viewId: String) {
        switch self {
        case .events(let view):
            return ("Events", view.rawValue)
        }
    }
}

public enum ViewIdentifier: String {
    case eventsList = "EventsList"
}
