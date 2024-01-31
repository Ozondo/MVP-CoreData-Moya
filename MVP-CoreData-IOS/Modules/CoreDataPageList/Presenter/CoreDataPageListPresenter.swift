//
//  CoreDataPageListPresenter.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 24.01.2024.
//

import Foundation


final class CoreDataPageListPresenter: CoreDataListOutput {
    weak var view: CoreDataListInput?
    private let coreDataService: CoreDataService
    
    init(coreDataService: CoreDataService) {
        self.coreDataService = coreDataService
    }
    
    func viewDidLoad() {
        let items = coreDataService.getChuckNorrisPhrase()
        view?.setItems(items: items)
    }
    
    func viewWillAppear() {
        
    }
}
