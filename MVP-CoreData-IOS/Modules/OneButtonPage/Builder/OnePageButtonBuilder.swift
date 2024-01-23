//
//  OnePageButtonBuilder.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 21.01.2024.
//

import Foundation
import UIKit


struct OnePageButtonBuilder {
    func build() -> UIViewController {
        
        let presenter = OnePagePresenter(service: OnePageServiceImpl())
        let view = OnePageButtonViewController(presenter: presenter)
        
        presenter.view = view
        
        return view
    }

}
