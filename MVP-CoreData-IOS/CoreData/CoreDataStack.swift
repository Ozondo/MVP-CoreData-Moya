//
//  CoreDataStack.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 24.01.2024.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    private let persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                assertionFailure(error.localizedDescription)
            }
        }
        return container
    }()
    //MARK: - viewContext
    lazy var viewContext: NSManagedObjectContext = {
        return persistantContainer.viewContext
    }()
    //MARK: - backgroundContext 
    lazy var backgroundContext: NSManagedObjectContext = {
        return persistantContainer.newBackgroundContext()
    }()
    
    private init() {}
    
}
