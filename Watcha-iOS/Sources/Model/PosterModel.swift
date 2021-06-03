//
//  Poster.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/16.
//

import Foundation
import UIKit

// 첫째장 제 남친 포스터와 영화 HER 포스터 데이터 모델 똑같,,죠?

struct PosterModel {
    let image: UIImage
    
    init(imageName : String) {
        if let image = UIImage(named: imageName)
        {
            self.image = image
        }
        else
        {
            self.image = UIImage()
        }
    }
}
