//
//  TextFieldPadding.swift
//  ITRTest
//
//  Created by Максим on 9.02.22.
//

import Foundation
import UIKit

class TextFieldPadding: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 142)
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
