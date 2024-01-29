//
//  ChuckNorris+CoreDataProperties.swift
//  
//
//  Created by Егор Иванов on 25.01.2024.
//
//

import Foundation
import CoreData


extension ChuckNorris {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChuckNorris> {
        return NSFetchRequest<ChuckNorris>(entityName: "ChuckNorris")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var iconURL: String?
    @NSManaged public var id: String?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var url: String?
    @NSManaged public var value: String?
    @NSManaged public var categories: NSSet?

}

// MARK: Generated accessors for categories
extension ChuckNorris {

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: Category)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: Category)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSSet)

}
