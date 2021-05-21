//
//  RecommandCVC.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/18.
//

import UIKit

class RecommandCVC: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    static let identifier = "RecommandCVC"
    static var Nib = UINib(nibName: "RecommandCVC", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyles()
    }
    
    func configure(with model: PosterModel) {
        self.imageView.image = model.image
    }
    
    func setStyles() {
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .watcha_white
        
        subtitleLabel.font = .maintitle_medium_rg
        subtitleLabel.textColor = .watcha_white
        subtitleLabel.numberOfLines = 2
    }
    
    

}
