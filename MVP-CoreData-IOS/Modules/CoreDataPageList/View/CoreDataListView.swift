//
//  CoreDataListView.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 24.01.2024.
//

import Foundation
import UIKit

final class CoreDataListView: UIView {
    
    //MARK: - private properties
    
    private enum Const {
        static let leadingConst: CGFloat = 10
        static let trailingConst: CGFloat = -10
    }
    
    private var items : [ChuckNorris] = []
    
    private let coreDataListTableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        return tableView
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSub()
        maskOff()
        setupTableView()
        layoutConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - setupTableView
    private func setupTableView() {
        backgroundColor = .white
        coreDataListTableView.dataSource = self
        coreDataListTableView.delegate = self
        coreDataListTableView.register(CoreDataListTableViewCell.self, forCellReuseIdentifier: "id")
    }
    
    //MARK: - add sub
    private func addSub() {
        [coreDataListTableView].forEach({ element in
            addSubview(element)
        })
    }
    
    //MARK: - mask off
    private func maskOff() {
        [coreDataListTableView].forEach({ element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
    }
    //MARK: - layout
    func layoutConstaints() {
        NSLayoutConstraint.activate([
            coreDataListTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            coreDataListTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Const.trailingConst),
            coreDataListTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Const.leadingConst),
            coreDataListTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension CoreDataListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = coreDataListTableView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as? CoreDataListTableViewCell else {return CoreDataListTableViewCell()}
        
        cell.layer.borderWidth = 1
        let dataForCell = items[indexPath.item]
        
        cell.setItemsForCell(items: dataForCell)
        
        return cell 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

extension CoreDataListView {
    func setItems(itemsFromNetwork: [ChuckNorris]) {
        self.items = itemsFromNetwork
        coreDataListTableView.reloadData()
    }
}
