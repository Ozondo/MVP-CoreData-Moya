//
//  CoreDataPageListPresenter.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 24.01.2024.
//

import Foundation


final class CoreDataPageListPresenter: CoreDataListOutput {
    
    weak var view: CoreDataListInput?
    private let service: CoreDataService
    private var response: CoreDataModel?
    
    init(service: CoreDataService) {
        self.service = service
    }
    
    func viewDidLoad() {
        service.loadItems(completion: { [weak self] result in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self?.view?.getItems(items: success.value)
                }
                
            case .failure(_):
                print("error")
            }
        })
    }
}
