//
//  UIViewController+Storyboard.swift
//  EvenTask
//
//  Created by Ahmed Ramy on 12/7/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

extension UIViewController {
    class func fromStoryboard() -> Self {
        let storyboardName = ("\(type(of: self))" as NSString).components(separatedBy: ".").first ?? "Main"
        return instantiateFromStoryboardHelper(type: self, storyboardName: storyboardName)
    }
    
    class func fromStoryboard(_ storyboardName: String) -> Self {
        return instantiateFromStoryboardHelper(type: self, storyboardName: storyboardName)
    }
    
    private class func instantiateFromStoryboardHelper<T>(type: T.Type, storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as! T
        return controller
    }
}

extension UIViewController {
    public static var defaultNib: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
    
    public static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}
