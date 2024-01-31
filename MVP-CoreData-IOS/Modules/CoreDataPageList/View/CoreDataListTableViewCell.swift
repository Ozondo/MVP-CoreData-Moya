//
//  CoreDataListTableViewCell.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 24.01.2024.
//

import Foundation
import UIKit


final class CoreDataListTableViewCell: UITableViewCell {
    //MARK: - private properties
    private let chuckNorrisPhrase: UILabel = {
        let text = UILabel()
        text.textAlignment = .center
        text.numberOfLines = 0
        text.textColor = .black
        return text
    }()
    
    private let createdDate: UILabel = {
        let text = UILabel()
        text.textColor = .black
        return text
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSub()
        maskOff()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - layout
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            chuckNorrisPhrase.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            chuckNorrisPhrase.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            chuckNorrisPhrase.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            createdDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            createdDate.topAnchor.constraint(equalTo: chuckNorrisPhrase.bottomAnchor)
        ])
    }
    //MARK: - add sub
    private func addSub() {
        [chuckNorrisPhrase,createdDate].forEach({ element in
            addSubview(element)
        })
    }
    
    //MARK: - mask off
    private func maskOff() {
        [chuckNorrisPhrase,createdDate].forEach({ element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
    }
}


extension CoreDataListTableViewCell {
    func setItemsForCell(items: ChuckNorris) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        createdDate.text = dateFormatter.string(from: items.createdAt ?? Date()) 
        chuckNorrisPhrase.text = items.value
        
    }
}

