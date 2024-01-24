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
        text.text = "ChuckNorrisPhrase"
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
            chuckNorrisPhrase.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    //MARK: - add sub
    private func addSub() {
        [chuckNorrisPhrase].forEach({ element in
            addSubview(element)
        })
    }
    
    //MARK: - mask off
    private func maskOff() {
        [chuckNorrisPhrase].forEach({ element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
    }
}

extension CoreDataListTableViewCell {
    func updateCell(items: CoreDataModel) {
        chuckNorrisPhrase.text = items.value
    }
}
