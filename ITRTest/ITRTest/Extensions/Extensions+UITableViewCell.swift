//
//  Extensions+UITableViewCell.swift
//  ITRTest
//
//  Created by Максим on 8.02.22.
//

import Foundation
import UIKit

extension UITableViewCell {
    static var reuseId: String {
        String(describing: self)
    }
}
