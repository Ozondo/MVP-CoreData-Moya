//
//  CoreDataModel.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 24.01.2024.
//

import Foundation
import UIKit



struct CoreDataModel: Codable {
    let id: String
    let value: String
    let url: String
    let createdAt: Date
    let updatedAt: Date
    let iconURL: String
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url
        case value
    }
}
