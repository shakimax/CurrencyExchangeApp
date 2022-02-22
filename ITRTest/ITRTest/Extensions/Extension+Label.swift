//
//  Extension+Label.swift
//  ITRTest
//
//  Created by Максим on 16.02.22.
//

import Foundation
import UIKit

extension UILabel {
    func setupCurrencyLabel() {
        font = UIFont.systemFont(ofSize: 24, weight: .bold)
        textColor = .label
        translatesAutoresizingMaskIntoConstraints = false
    }
}
