//
//  CoreDataListIO.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 24.01.2024.
//

import Foundation


protocol CoreDataListInput: AnyObject {
    func setItems(items: [ChuckNorris])
}


protocol CoreDataListOutput {
    func viewDidLoad()
    func viewWillAppear()
}
