//
//  SmallPosterCVC.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/18.
//

import UIKit

class SmallPosterCVC: UICollectionViewCell {

    @IBOutlet var imageView : UIImageView!
    
    static let identifier = "SmallPosterCVC"
    static var Nib = UINib(nibName: "SmallPosterCVC", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .watcha_bg
        
    }
    
    func configure(with model: SmallPosterModel) {
        self.imageView.image = model.image
    }

}
