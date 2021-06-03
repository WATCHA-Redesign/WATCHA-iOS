//
//  NetworkResult.swift
//  Watcha-iOS
//
//  Created by 한상진 on 2021/06/03.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
