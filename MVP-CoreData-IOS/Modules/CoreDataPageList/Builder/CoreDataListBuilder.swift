//
//  CoreDataListBuilder.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 24.01.2024.
//

import Foundation
import UIKit


struct CoreDataListBuilder {
    func build() -> UIViewController {
        let presenter = CoreDataPageListPresenter(service: CoreDataNetworkServiceImpl())
        
        let view = CoreDataListViewController(presenter: presenter)
        
        presenter.view = view
        
        
        return view 
    }
}


