//
//  Extension+ImageView.swift
//  ITRTest
//
//  Created by Максим on 16.02.22.
//

import Foundation
import UIKit

extension UIImageView {
    func setupFlagImageView() {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleToFill
        clipsToBounds = true
        layer.cornerRadius = 15
        layer.borderWidth = 0.3
        layer.borderColor = UIColor.systemGray.cgColor
    }
}
