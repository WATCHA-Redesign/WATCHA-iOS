//
//  DirectorCVC.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/18.
//

import UIKit

class DirectorCVC: UICollectionViewCell {

    @IBOutlet var nameView: UIView!
    @IBOutlet var nameLabel: UILabel!
    
    static let identifier = "DirectorCVC"
    static var Nib = UINib(nibName: "DirectorCVC", bundle: nil)
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setStyles()
    }

    func configure(with model: NameModel) {
        let isDirector = model.isDirector
        
        nameView.backgroundColor =
            isDirector ? .watcha_bg : .watcha_pink
        nameView.layer.cornerRadius = 15
        nameView.layer.borderWidth = 1
        nameView.layer.borderColor =
            isDirector ? UIColor.watcha_pink.cgColor
                        : UIColor.watcha_bg.cgColor
        
        nameLabel.text = model.name
        nameLabel.textColor =
            isDirector ? .watcha_pink : .watcha_bg
    }
    
    func setStyles() {
        nameLabel.textColor = .watcha_white
    }
    
    

}
