//
//  BannerDataModel.swift
//  Watcha-iOS
//
//  Created by 한상진 on 2021/06/03.
//

import Foundation

struct MainBannerDataModel: Codable {
    let success: Bool
    let message: String
    let data: MainDataClass
}

// MARK: - DataClass
struct MainDataClass: Codable {
    let mainBanner: [MainBanner]
}

// MARK: - MainBanner
struct MainBanner: Codable {
    let image: String
    let largeTitle, mainBannerDescription: String

    enum CodingKeys: String, CodingKey {
        case image, largeTitle
        case mainBannerDescription = "description"
    }
}
