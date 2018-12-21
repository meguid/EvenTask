//
//  AppDelegate.swift
//  EvenTask
//
//  Created by Ahmed Meguid on 12/6/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "EventTask")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do { try context.save() }
            catch { fatalError("Unresolved error \(error as NSError), \((error as NSError).userInfo)") }
        }
    }
}

