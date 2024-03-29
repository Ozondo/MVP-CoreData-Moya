//
//  CoreDataListViewController.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 21.01.2024.
//

import UIKit

final class CoreDataListViewController: UIViewController, CoreDataListInput {
    //MARK: - private properties 
    
    private let presenter: CoreDataListOutput
    private let coreDataListView = CoreDataListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

    }
    //MARK: - init
    init(presenter: CoreDataListOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = coreDataListView
    }
    
    func setItems(items: [ChuckNorris]) {
        coreDataListView.setItems(itemsFromNetwork: items)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        coreDataListView.reload()
    }
}
