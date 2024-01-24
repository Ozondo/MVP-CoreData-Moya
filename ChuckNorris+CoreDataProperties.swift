//
//  ChuckNorris+CoreDataProperties.swift
//  
//
//  Created by Егор Иванов on 23.01.2024.
//
//

import Foundation
import CoreData


extension ChuckNorris {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChuckNorris> {
        return NSFetchRequest<ChuckNorris>(entityName: "ChuckNorris")
    }

    @NSManaged public var id: String?
    @NSManaged public var value: String?
    @NSManaged public var url: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var updatedAt: Date?
    @NSManaged public var iconURL: String?

}
