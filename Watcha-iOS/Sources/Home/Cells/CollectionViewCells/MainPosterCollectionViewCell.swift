//
//  MainPosterCollectionViewCell.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/16.
//

import UIKit

class MainPosterCollectionViewCell: UICollectionViewCell {
    
    //MARK:- IBOutlet Part
        
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet weak var posterLargeTitle: UILabel!
    @IBOutlet weak var posterDescription: UILabel!
    
    
    //MARK:- Variable Part
    
    //MARK:- Life Cycle Part

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
