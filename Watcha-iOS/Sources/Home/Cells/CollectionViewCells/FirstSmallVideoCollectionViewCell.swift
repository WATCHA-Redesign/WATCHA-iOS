//
//  EndingAskCollectionViewCell.swift
//  Watcha-iOS
//
//  Created by 한상진 on 2021/05/18.
//

import UIKit

class SmallVideoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var smallVideoImageView: UIImageView!
    @IBOutlet weak var smallVideoTitleLabel: UILabel!
    
    //MARK:- Variable Part
      /// 뷰컨에 필요한 변수들을 선언합니다  // 변수명 lowerCamelCase 사용
      /// ex)  var imageViewList : [UIImageView] = []
    
    static var nib: UINib {
        UINib(nibName: "SmallVideoCollectionViewCell", bundle: nil)
    }
    
    static let identifier = "SmallVideoCollectionViewCell"

    
    //MARK:- Life Cycle Part
       /// 앱의 Life Cycle 부분을 선언합니다
       /// ex) override func awakeFromNib() { }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        smallVideoTitleLabel.textColor = UIColor.watcha_lightgray2
    }
}
