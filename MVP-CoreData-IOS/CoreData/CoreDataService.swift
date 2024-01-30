//
//  CoreDataService.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 24.01.2024.
//

import Foundation
import UIKit
import CoreData

//MARK: - CoreDataService
protocol CoreDataService {
    func saveItems(items: OnePageResponse)
    func getGrouppedItems() -> [(Category, [ChuckNorris])]
    func getChuckNorrisPhrase() -> [ChuckNorris]
}

//MARK: - CoreDataServiceImpl
final class CoreDataServiceImpl: CoreDataService {
    
    private let dateFormatter = DateFormatter()
    init() {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    }
    
    func saveItems(items: OnePageResponse) {
        let context = CoreDataStack.shared.backgroundContext
        
        let chuckNorrisJokeModel = ChuckNorris(context: context)
        
        chuckNorrisJokeModel.value = items.value
        chuckNorrisJokeModel.updatedAt = dateFormatter.date(from: items.updatedAt) ?? Date()
        chuckNorrisJokeModel.id = items.id
        chuckNorrisJokeModel.iconURL = items.iconURL
        chuckNorrisJokeModel.createdAt = dateFormatter.date(from: items.createdAt) ?? Date()
        chuckNorrisJokeModel.url = ""
        
        let categories = getOrCreateCategories(for: items, context: context)
        
        for category in categories {
            chuckNorrisJokeModel.addToCategories(category)
        }
        try? context.save()
    }
    
    func getChuckNorrisPhrase() -> [ChuckNorris] {
        let context = CoreDataStack.shared.backgroundContext
        
        let request = ChuckNorris.fetchRequest()
        
        guard let fetchResult = try? context.fetch(request)  else { return [] }
        
        return fetchResult
    }
    
    func getGrouppedItems() -> [(Category, [ChuckNorris])] {
        let context = CoreDataStack.shared.backgroundContext
        
        let request = Category.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        guard let fetchResult = try? context.fetch(request) else { return [] }

        var result: [(Category, [ChuckNorris])] = []
        for category in fetchResult {
            let request = ChuckNorris.fetchRequest()
            request.predicate = NSPredicate(format: "categories.name contains[cd] %@", category.name!)
            guard let fetchResult = try? context.fetch(request) else { continue }
            result.append((category, fetchResult))
        }
        return result
    }
    
    private func getOrCreateCategories(for response: OnePageResponse, context: NSManagedObjectContext) -> [Category] {
        var result: [Category] = []
        for category in response.categories {
            let request = Category.fetchRequest()
            request.predicate = NSPredicate(format: "name == %@", category)
            let fetchResult = try? context.fetch(request)
            if let categoryModel = fetchResult?.first {
                result.append(categoryModel)
            } else {
                let newCategoryModel = Category(context: context)
                newCategoryModel.name = category
                result.append(newCategoryModel)
            }
        }
        return result
    }
}
