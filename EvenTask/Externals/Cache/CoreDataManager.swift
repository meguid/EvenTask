//
//  CoreDataManager.swift
//
//  Created by Ahmed Meguid on 12/5/18.
//  Copyright © 2018 Ahmed Meguid. All rights reserved.
//

import UIKit
import CoreData

extension CachingKey {
    func entity() -> String {
        return self.rawValue
    }
    
    func key() -> String {
        return self.rawValue
    }
    
    func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<NSFetchRequestResult>()
    }
}

class CoreDataManager: NSObject, CacheProtocol {
    
    func getObject<T>(_ object: T, key: CachingKey) -> T? where T : Decodable, T : Encodable {
        return getData(key: key)?[0].decode(object)
    }
    
    func saveObject<T>(_ object: T, key: CachingKey) where T : Decodable, T : Encodable {
        saveData(object.encode(), key: key)
    }
    
    func getData(key: CachingKey) -> [Data]? {
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ImageWithFaces")
        do{
            return try context.fetch(fetchRequest) as? [Data]
        } catch {
            return nil
        }
    }
    
    func saveData(_ data: Data?, key: CachingKey) {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: key.entity(),in: context)
        let faceImage = NSManagedObject(entity: entity!, insertInto: context)
        faceImage.setValue(Date(), forKey: "date")
        faceImage.setValue(data, forKey: key.key())
        try? context.save()
    }
    
    func removeObject(key: CachingKey) {
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: key.fetchRequest())
        do{
            try context.execute(delete)
        } catch{ }
    }
    
    func getContext() -> NSManagedObjectContext{
        let appleDelegate = UIApplication.shared.delegate as? AppDelegate
        return (appleDelegate?.persistentContainer.viewContext)!
    }
}
