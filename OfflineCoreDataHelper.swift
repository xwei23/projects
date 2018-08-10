//
//  OfflineCoreDataHelper.swift
//  Hestan_Cue
//
//  Created by Xuelun Wei on 6/29/18.
//  Copyright © 2018 Hestan Smart Cooking. All rights reserved.
//

import UIKit
import CoreData

@objc class OfflineCoreDataHelper: NSObject{
    
    @objc static var context:NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    @objc static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer.init(name: "RecipeModel") //pass in the name of model
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let nsError = error as NSError?{
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        })
        return container
    }()
    
    @objc static func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }
            catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                
            }
        }
    }
}
