//
//  SecondSmallVideoService.swift
//  Watcha-iOS
//
//  Created by 한상진 on 2021/06/04.
//

import Foundation
struct SecondSmallVideoDataModel: Codable {
    let success: Bool
    let message: String
    let data: SecondDataClass
}

// MARK: - DataClass
struct SecondDataClass: Codable {
    let mainRecommend: [MainRecommend]
}

// MARK: - MainRecommend
struct MainRecommend: Codable {
    let image: String
    let title: String
}
