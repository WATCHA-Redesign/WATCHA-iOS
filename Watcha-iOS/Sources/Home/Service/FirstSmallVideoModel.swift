//
//  FirstSmallVideoModel.swift
//  Watcha-iOS
//
//  Created by 한상진 on 2021/06/03.
//

import Foundation

// MARK: - Welcome
struct FirstSmallVideoDataModel: Codable {
    let success: Bool
    let message: String
    let data: FirstDataClass
}

// MARK: - DataClass
struct FirstDataClass: Codable {
    let mainWatching: [MainWatching]
}

// MARK: - MainWatching
struct MainWatching: Codable {
    let image: String
    let title: String
    let progress: Int
}
