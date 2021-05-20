//
//  UIFont.swift
//  Watcha_iOS
//
//  Created by JEN Lee on 2021/05/16.
//

import Foundation
import UIKit

extension UIFont {
    //Noto Sans Kannada Regular 17.0
    //MARK: 앱 폰트
    
    class var maintitle_big_bold: UIFont { .systemFont(ofSize: 32, weight: .bold)! }
    //UIFont(name: "NotoSans-Bold", size: 32)!
    class var subtitle_medium_bold: UIFont { .systemFont(ofSize: 17, weight: .semibold)! }
    //UIFont(name: "NotoSans-SemiBold", size: 17)!
    class var explain_small_rg_12: UIFont { .systemFont(ofSize: 12, weight: .regular)! }
    //UIFont(name: "NotoSans-Regular", size: 12)!
    class var maintitle_medium_rg: UIFont { .systemFont(ofSize: 14, weight: .semibold)! }
    //UIFont(name: "NotoSans-SemiBold", size: 14)!
    class var explain_small_number: UIFont { .systemFont(ofSize: 12, weight: .regular)! }
    //UIFont(name: "NotoSans-Regular", size: 12)!
    class var collection_title: UIFont { .systemFont(ofSize: 16, weight: .regular)! }
    class var collection_crew: UIFont { .systemFont(ofSize: 14, weight: .regular)! }


}
