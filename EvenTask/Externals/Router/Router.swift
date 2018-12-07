//
//  Router.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit

class Router: RouterProtocol {
    
    var presentedView: BaseView!
    
    func present(view: BaseView) {
        presentedView.present(view, animated: true, completion: nil)
    }
    
    func startActivityIndicator() { }
    
    func stopActivityIndicator() { }
    
    func dismiss() {
        presentedView.dismiss(animated: true, completion: nil)
    }
    
    func pop() {
        _ = presentedView.navigationController?.popViewController(animated: true)
    }
    
    func segue(storyboard: Storyboard) {
        presentedView.navigationController?.pushViewController(storyboard.viewController(), animated: true)
    }
    
    func alert(title: String, message: String, actions: [(title: String, style: UIAlertAction.Style)]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.map({UIAlertAction(title: $0.title, style: $0.style, handler: nil)}).forEach({alert.addAction($0)})
        presentedView.present(alert, animated: true)
    }
}
