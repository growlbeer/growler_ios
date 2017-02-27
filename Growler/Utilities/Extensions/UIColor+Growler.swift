//
//  UIColor+Growler.swift
//  Growler
//
//  Created by Matthew Bush on 2/26/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

extension UIColor {
    func lighter(by percentage: Float) -> UIColor? { return adjust(by: abs(CGFloat(percentage))) }
    func darker(by percentage: Float) -> UIColor? { return adjust(by: -1 * abs(CGFloat(percentage))) }
    
    func adjust(by percentage: CGFloat) -> UIColor? {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if getRed(&r, green: &g, blue: &b, alpha: &a) {
            return UIColor(red: min(r + percentage/100, 1.0),
                           green: min(g + percentage/100, 1.0),
                           blue: min(b + percentage/100, 1.0),
                           alpha: a)
        } else { return nil }
    }
}
