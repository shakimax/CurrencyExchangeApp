//
//  Extension+String.swift
//  ITRTest
//
//  Created by Максим on 10.02.22.
//

import Foundation
import UIKit

extension String {
    func trimWhiteSpace() -> String {
        let string = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return string
    }
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
