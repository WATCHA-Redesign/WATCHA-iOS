//
//  nameModel.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/17.
//

import Foundation
import UIKit

//Search 뷰 사람 이름이랑 감독인지 아닌지 진실혹은거짓 해주면 버튼 색깔 buttonColor 변수에 담김니다
struct NameModel {
    let name: String
    let isDirector: Bool
    
    init(name: String, isDirector: Bool) {
        self.name = name
        self.isDirector = isDirector
    }
}

