//
//  MainPosterCollectionViewCell.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/16.
//

import UIKit

class MainPosterCollectionViewCell: UICollectionViewCell {
    
    //MARK:- IBOutlet Part
        /// Label, ColelctionView, TextField, ImageView 등 @IBOutlet 변수들을 선언합니다.  // 변수명 lowerCamelCase 사용
        /// ex)  @IBOutlet weak var qnaTextBoxBackgroundImage: UIImageView!

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    
    
    //MARK:- Variable Part
      /// 뷰컨에 필요한 변수들을 선언합니다  // 변수명 lowerCamelCase 사용
      /// ex)  var imageViewList : [UIImageView] = []
    
    static var nib: UINib {
        UINib(nibName: "MainPosterCollectionViewCell", bundle: nil)
    }
    
    static let identifier = "MainPosterCollectionViewCell"

    
    //MARK:- Life Cycle Part
       /// 앱의 Life Cycle 부분을 선언합니다
       /// ex) override func awakeFromNib() { }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure(with model: PosterModel) {
        self.titleLabel.text = model.title
        self.posterImageView.image = model.image
    }

}
