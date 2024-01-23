//
//  OnePageButtonViewController.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 21.01.2024.
//

import UIKit

final class OnePageButtonViewController: UIViewController, OnePageInput, OnePageViewDelegate {
    
    private let presenter: OnePageOutput
    private var onePageView = OnePageView()

    
    init(presenter: OnePageOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func loadView() {
        view = onePageView
        onePageView.delegate = self 
    }
}

extension OnePageButtonViewController {
    func buttonDidTapped() {
        presenter.buttonDidTapped()
    }
    
    func getPhraseFromNetwork(text: String) {
        onePageView.updtaeText(textFromNetwork: text)
    }
}
