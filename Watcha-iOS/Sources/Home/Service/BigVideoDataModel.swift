//
//  BigVideoDataModel.swift
//  Watcha-iOS
//
//  Created by 한상진 on 2021/06/04.
//

import Foundation

struct BigVideoDataModel: Codable {
    let success: Bool
    let message: String
    let data: BigDataClass
}

// MARK: - DataClass
struct BigDataClass: Codable {
    let mainPedia: [MainPedia]
}

// MARK: - MainPedia
struct MainPedia: Codable {
    let image: String
    let title, titleDetail: String
    let watchingNum: Int
    let nickname: String
}
