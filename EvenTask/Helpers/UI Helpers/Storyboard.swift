//
//  Storyboard.swift
//  EvenTask
//
//  Created by Ahmed Ramy on 12/7/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func instantiateInitialViewController(with id: Storyboard) -> UIViewController {
        let story = UIStoryboard(name: id.rawValue, bundle: nil)
        return story.instantiateInitialViewController()!
    }
}

public enum Storyboard: String {
    case Home
    
    public func viewController<VC: UIViewController>(_ viewIdentifier: String, bundle: Bundle? = nil) -> VC {
        guard let vc = UIStoryboard(name: self.rawValue, bundle: bundle)
            .instantiateViewController(withIdentifier: viewIdentifier) as? VC else {
                fatalError("Failed To Instantiate ViewController: \(viewIdentifier) didn't match \(self.rawValue)!")
        }
        return vc
    }
    
    public func initialViewController(_ bundle: Bundle? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: self.rawValue, bundle: bundle)
        guard let vc = storyboard.instantiateInitialViewController() else { fatalError("\(self.rawValue) doesn't contain a Initial View Controller!")}
        return vc
    }
}
