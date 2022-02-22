//
//  Extension+TextField.swift
//  ITRTest
//
//  Created by Максим on 16.02.22.
//

import Foundation
import UIKit

extension UITextField {
    func setupTextfield() {
        font = UIFont.systemFont(ofSize: 16, weight: .regular)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray.cgColor
        placeholder = "Enter Value"
        keyboardType = .decimalPad
        returnKeyType = .done
        leftViewMode = .always
        backgroundColor = .tertiarySystemBackground
    }
}
