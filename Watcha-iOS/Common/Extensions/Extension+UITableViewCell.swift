//
//  Extension+UITableViewCell.swift
//  Watcha-iOS
//
//  Created by JEN Lee on 2021/05/18.
//

import Foundation
import UIKit

protocol ReusableTableViewCell {
    static var reuseIdentifier: String { get }
}
extension ReusableTableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
extension UITableViewCell: ReusableTableViewCell { }
