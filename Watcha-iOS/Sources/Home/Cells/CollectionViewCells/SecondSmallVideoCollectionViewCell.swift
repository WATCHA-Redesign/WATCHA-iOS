//
//  SecondSmallVideoCollectionViewCell.swift
//  Watcha-iOS
//
//  Created by 한상진 on 2021/05/18.
//

import UIKit

class SecondSmallVideoCollectionViewCell: UICollectionViewCell {
    
    //MARK:- IBOutlet Part
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    
    //MARK:- Variable Part
    
    //MARK:- Life Cycle Part
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        title.textColor = UIColor.watcha_lightgray
//        title.font = UIFont.explain_small_number
    }
}
