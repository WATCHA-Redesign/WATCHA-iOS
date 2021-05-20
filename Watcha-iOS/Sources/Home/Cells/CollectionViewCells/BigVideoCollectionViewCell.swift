//
//  BigVideoCollectionViewCell.swift
//  Watcha-iOS
//
//  Created by 한상진 on 2021/05/18.
//

import UIKit

class BigVideoCollectionViewCell: UICollectionViewCell {
    
    //MARK:- IBOutlet Part
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var watchingUser: UILabel!
    
    //MARK:- Variable Part
    
    //MARK:- Life Cycle Part
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        title.textColor = UIColor.watcha_lightgray
        episode.textColor = UIColor.watcha_pink
        watchingUser.textColor = UIColor.watcha_inactive
    }
}
