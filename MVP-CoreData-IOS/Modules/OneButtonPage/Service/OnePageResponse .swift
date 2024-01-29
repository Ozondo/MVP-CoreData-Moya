//
//  OnePageResponse .swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 22.01.2024.
//

import Foundation
import UIKit

struct OnePageResponse: Codable {
    var createdAt: String
    var iconURL: String
    var id: String 
    var updatedAt: String
    var url: String
    var value: String
    var categories: [String]

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url
        case value
        case categories
    }
}
