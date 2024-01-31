//
//  Category+CoreDataProperties.swift
//  
//
//  Created by Егор Иванов on 25.01.2024.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?

}
