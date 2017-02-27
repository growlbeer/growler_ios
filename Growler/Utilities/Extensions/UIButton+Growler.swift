//
//  UIButton+Growler.swift
//  Growler
//
//  Created by Matthew Bush on 2/26/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

extension UIButton {
    func setBackground(withColor color: UIColor) {
        setBackgroundImage(background(withColor: color, alpha: 1), for: .normal)
        setBackgroundImage(background(withColor: color.darker(by: 10) ?? color, alpha: 1), for: .selected)
        setBackgroundImage(background(withColor: color.darker(by: 10) ?? color, alpha: 1), for: .highlighted)
        setBackgroundImage(background(withColor: color, alpha: 0.8), for: .disabled)
    }
    
    func setTitle(_ title: String, color: UIColor, font: UIFont) {
        setTitle(title, for: .normal)
        setTitle(title, for: .selected)
        setTitle(title, for: .highlighted)
        setTitle(title, for: .disabled)
        titleLabel?.font = Style.regularSansFont(withSize: 16)
        setTitleColor(color, for: .normal)
        setTitleColor(color.darker(by: 10) ?? color, for: .selected)
        setTitleColor(color.darker(by: 10) ?? color, for: .highlighted)
        setTitleColor(color.withAlphaComponent(0.8), for: .disabled)
        adjustsImageWhenDisabled = false
        adjustsImageWhenHighlighted = false
    }
    
    fileprivate func background(withColor color: UIColor, alpha: CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()?.setFillColor(color.withAlphaComponent(alpha).cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        guard let colorImage = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        UIGraphicsEndImageContext()
        return colorImage
    }

}
