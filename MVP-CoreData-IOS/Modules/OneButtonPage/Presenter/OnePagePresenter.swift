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
    
    init(service: OnePageService) {
        self.service = service
    }
    
    func viewDidLoad() {
    }
    
    func buttonDidTapped() {
        service.loadItems(completion: { [weak self] result in
            switch result {
            case .success(let success):
                self?.response = success
                DispatchQueue.main.async {
                    self?.view?.getPhraseFromNetwork(text: success.value)
                }
            case .failure(_):
                print("error")
            }
        })
    }
}
