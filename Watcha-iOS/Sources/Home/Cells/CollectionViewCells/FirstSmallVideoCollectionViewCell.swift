//
//  EndingAskCollectionViewCell.swift
//  Watcha-iOS
//
//  Created by 한상진 on 2021/05/18.
//

import UIKit

class FirstSmallVideoCollectionViewCell: UICollectionViewCell {
    
    //MARK:- IBOutlet Part
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    //MARK:- Variable Part
    
    //MARK:- Life Cycle Part
       
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        title.textColor = UIColor.watcha_lightgray2
//        title.font = UIFont.explain_small_rg_12
    }
}
