//
//  SmallPosterModel.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/17.
//

import Foundation
import UIKit

//Search 뷰 맨위 데이터 모델 인기검색 콘텐츠

struct SmallPosterModel {
    let image: UIImage
    
    init(imageName: String) {
        
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

