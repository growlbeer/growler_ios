//
//  UIImage+Growler.swift
//  Growler
//
//  Created by Matthew Bush on 1/29/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

extension UIImage {
    class func image(fromColor color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        UIGraphicsEndImageContext()
        
        return image
    }
}
