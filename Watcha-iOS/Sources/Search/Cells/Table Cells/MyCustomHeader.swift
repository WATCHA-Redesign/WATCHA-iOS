//
//  MyCustomHeader.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/18.
//

import UIKit

class MyCustomHeader: UITableViewHeaderFooterView  {

    //MARK: Property
    let titleLabel = UILabel()
    let button = UIButton()
    
    
    //MARK: 생성자
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: UI
    func configureContents() {
        
        titleLabel.font = .subtitle_medium_bold
        titleLabel.tintColor = .watcha_white
        
        button.setImage(UIImage(named: "tabSearchMoreviewIos1"), for: .normal)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 276),
            titleLabel.heightAnchor.constraint(equalToConstant: 19),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor, constant: 12),
            button.heightAnchor.constraint(equalToConstant: 16),
            button.widthAnchor.constraint(equalToConstant: 58),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        
        ])
    }
    
    
}
