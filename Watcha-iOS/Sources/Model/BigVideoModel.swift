//
//  BigVideoModel.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/17.
//

import Foundation
import UIKit

// 거침없이 무야호 ~
//데이터 모델 시청 대표자랑 몇명이 보고있는지 받고 watchingStatus string 으로 리턴함니다

struct BigVideoModel {
    let image: UIImage
    let title: String
    let episode: String
    let watchingStatus: String
    
    
    init(imageName : String,
         title: String,
         episode: String,
         watchingPerson: String,
         numOfpeople: Int) {
        
        
        self.title = title
        self.episode = episode
        self.watchingStatus = "\(watchingPerson) 님 외 \(numOfpeople) 명 시청 중"
        
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

