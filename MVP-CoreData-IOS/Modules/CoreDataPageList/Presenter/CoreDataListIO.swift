//
//  CoreDataListIO.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 24.01.2024.
//

import Foundation


protocol CoreDataListInput: AnyObject {
    func getItems(items: [CoreDataModel]) 
}


protocol CoreDataListOutput {
    func viewDidLoad()
}
