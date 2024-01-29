//
//  OnePageIO.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 22.01.2024.
//

import Foundation


protocol OnePageInput: AnyObject {
    func buttonDidTapped()
    
    func getPhraseFromNetwork(items: OnePageResponse)
}


protocol OnePageOutput {
    func viewDidLoad()
    
    func buttonDidTapped()
}
