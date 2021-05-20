//
//  UIColor.swift
//  Watcha_iOS
//
//  Created by JEN Lee on 2021/05/16.
//

import Foundation
import UIKit

extension UIColor {
    
    // MARK: hex 변환 가능 init
    convenience init(hex: UInt, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hex & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    
    // MARK: 색깔들, watcha_ 로 시작
    // 저거 다 받고 싶은데 피그마 사용법 모름 ㅍㅅㅍ
    
    class var watcha_white: UIColor { UIColor(hex: 0xFFFFFF) }
    class var watcha_black: UIColor { UIColor(hex: 0x000000) }
    class var watcha_bg: UIColor { UIColor(hex: 0x1A1A1A) }
    class var watcha_lightgray: UIColor { UIColor(hex: 0xd9d9d9) }
    class var watcha_lightgray2: UIColor { UIColor(hex: 0xC3C3C3 ) }
    class var watcha_gray: UIColor { UIColor(hex: 0x858687) }
    class var watcha_pink: UIColor { UIColor(hex: 0xFF0558) }
    class var watcha_inactive: UIColor { UIColor(hex: 0x5C5C5C) }
    
}

