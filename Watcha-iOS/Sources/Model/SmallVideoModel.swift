//
//  SmallVideoModel.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/17.
//

import Foundation
import UIKit

//이건 홈뷰 두번째 네번째 컬뷰 데이터 모델

struct SmallVideoModel {
    let image: UIImage
    let title: String
    
    init(imageName : String, title: String) {
        self.title = title
        
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
