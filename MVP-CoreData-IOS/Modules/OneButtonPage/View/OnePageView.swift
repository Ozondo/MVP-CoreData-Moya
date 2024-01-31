//
//  OnePageView.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 22.01.2024.
//

import UIKit

protocol OnePageViewDelegate: AnyObject {
    func buttonDidTapped()
}

final class OnePageView: UIView{
    
    weak var delegate: OnePageViewDelegate?
    
    
    //MARK: - private properties
    private let chuckNorrisPhrase: UILabel = {
        let text = UILabel()
        text.text = "Нажмите на конпку"
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    private let buttonToCreatePhrase: UIButton = {
        let button = UIButton()
        button.setTitle("click", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        
        return button
    }()

    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        AddSub()
        MaskOff()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - objc method
    
    @objc func buttonTapped() {
        delegate?.buttonDidTapped()
    }
    
    //MARK: - setup view
    
    private func setupView() {
        backgroundColor = .white
        buttonToCreatePhrase.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    //MARK: - add sub
    private func AddSub() {
        [chuckNorrisPhrase,buttonToCreatePhrase].forEach({ element in
            addSubview(element)
        })
    }
    
    //MARK: - mask off
    private func MaskOff() {
        [chuckNorrisPhrase,buttonToCreatePhrase].forEach({ element in
            element.translatesAutoresizingMaskIntoConstraints = false
        })
    }
    //MARK: - layout
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            chuckNorrisPhrase.centerXAnchor.constraint(equalTo: centerXAnchor),
            chuckNorrisPhrase.centerYAnchor.constraint(equalTo: centerYAnchor),
            chuckNorrisPhrase.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            chuckNorrisPhrase.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            buttonToCreatePhrase.topAnchor.constraint(equalTo: chuckNorrisPhrase.bottomAnchor, constant: 30),
            buttonToCreatePhrase.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}

extension OnePageView {
    func updateText(itemsFromNetwork: OnePageResponse) {
        chuckNorrisPhrase.text = itemsFromNetwork.value
        layoutIfNeeded()
    }
}
