//
//  crewModel.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/17.
//

import Foundation
import UIKit

//닉넴받아서  ~~Pick ! 이 string whosPick 변수에 담김니다
struct CrewCollectionModel {
    let title: String
    let whosPick: String
    
    init(title: String, pickerName: String) {
        self.title = title
        self.whosPick = "\(pickerName)님 Pick!"
    }
}
