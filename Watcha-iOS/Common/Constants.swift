//
//  Constants.swift
//  Watcha_iOS
//
//  Created by JEN Lee on 2021/05/16.
//

import Foundation
import UIKit

struct Constants {
           
    //MARK: 공용 변수 저장소
    
    struct Image {
        // ex) static let poster = UIImage(named: "poster")
    }
    
    struct API {
        static let baseURL = "http://15.164.171.220:5000"
        static let bannerURL = baseURL + "/api/mainpage/banner"
        static let watchingURL = baseURL + "/api/mainpage/watching"
        static let pediaURL = baseURL + "/api/mainpage/pedia"
        static let recommendURL = baseURL + "/api/mainpage/recommend"
    }
}
