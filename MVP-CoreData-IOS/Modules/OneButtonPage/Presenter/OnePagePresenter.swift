//
//  OnePagePresenter.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 22.01.2024.
//

import Foundation

final class OnePagePresenter: OnePageOutput {
    weak var view: OnePageInput?
    private let service: OnePageService
    private var response: OnePageResponse?
    private let coreDataService: CoreDataService
    
    init(service: OnePageService,coreDataService: CoreDataService) {
        self.service = service
        self.coreDataService = coreDataService
    }
    
    func viewDidLoad() {
    }
    
    func buttonDidTapped() {
        service.loadItems(completion: { [weak self] result in
            switch result {
            case .success(let success):
                self?.response = success
                DispatchQueue.main.async {
                    self?.view?.getPhraseFromNetwork(items: success)
                }
                self?.coreDataService.saveItems(items: success)
            case .failure(_):
                print("error")
            }
        })
    }
}
