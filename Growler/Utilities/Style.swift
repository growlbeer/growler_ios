//
//  Style.swift
//  Growler
//
//  Created by Matt Bush on 1/10/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

struct Style {
    
    // MARK: Colors
    static let orange       = UIColor(red: 211/255, green: 75/255, blue: 20/255, alpha: 1)
    static let brown        = UIColor(red: 107/255, green: 81/255, blue: 68/255, alpha: 1)
    static let tan          = UIColor(red: 178/255, green: 140/255, blue: 103/255, alpha: 1)
    static let grayLight    = UIColor(red: 238/255, green: 238/255, blue: 239/255, alpha: 1)
    static let gray         = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
    static let white        = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    static let black        = UIColor(red: 24/255, green: 24/255, blue: 24/255, alpha: 1)
    
    // MARK: Fonts
    static func regularSansFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: Constants.kRegularSansFontName, size: size)!
    }
    
    static func lightSansFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: Constants.kLightSansFontName, size: size)!
    }
    
    static func semiBoldSansFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: Constants.kSemiBoldSansFontName, size: size)!
    }
    
    static func boldSansFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: Constants.kBoldSansFontName, size: size)!
    }
    
    static func regularSerifFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: Constants.kRegularSerifFontName, size: size)!
    }
    
    static func italicSerifFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: Constants.kItalicSerifFontName, size: size)!
    }
    
    static func boldSerifFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: Constants.kBoldSerifFontName, size: size)!
    }
    
    // MARK: Theme UI
    static func themeUI() {
        themeUINavigationBar()
        themeUISegmentedControl()
        themeUITextField()
        themeTabBar()
    }
    
    static private func themeUINavigationBar() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage.image(fromColor: Style.grayLight)
        UINavigationBar.appearance().barTintColor = Style.white
        UINavigationBar.appearance().tintColor = Style.gray
        UINavigationBar.appearance().isTranslucent = false
        let titleDict: NSDictionary = [
            NSForegroundColorAttributeName: Style.black,
            NSFontAttributeName: Style.regularSerifFont(withSize: 18.0)
        ]
        UINavigationBar.appearance().titleTextAttributes = titleDict as? [String : AnyObject]
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "Back")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "Back")
    }
    
    static private func themeUISegmentedControl() {
        UISegmentedControl.appearance().tintColor = Style.brown
        let attr = NSDictionary(object: Style.regularSansFont(withSize: 14.0), forKey: NSFontAttributeName as NSCopying)
        UISegmentedControl.appearance().setTitleTextAttributes(attr as [NSObject : AnyObject] , for: .normal)
    }
    
    static private func themeUITextField() {
        UITextField.appearance().tintColor = Style.orange
        UITextField.appearance().font = Style.lightSansFont(withSize: 18)
        Style.addBottomBorder(toLayer: UITextField.appearance().layer, onFrame: UITextField.appearance().frame, color: Style.gray.cgColor)
    }
    
    static private func themeTabBar() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage.image(fromColor: Style.grayLight)
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = Style.gray
        UITabBar.appearance().barTintColor = Style.white
        let attrsNormal = [
            NSForegroundColorAttributeName : Style.gray,
            NSFontAttributeName : Style.regularSansFont(withSize: 12)
        ]
        let attrsSelected = [
            NSForegroundColorAttributeName : Style.orange,
            NSFontAttributeName : Style.regularSansFont(withSize: 12)
        ]
        UITabBarItem.appearance().setTitleTextAttributes(attrsNormal, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(attrsSelected, for: .selected)
    }
    
    // MARK: Helpers
    static func addBottomBorder(toLayer layer: CALayer, onFrame frame: CGRect, color: CGColor) {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color
        border.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: frame.size.height)
        border.borderWidth = width
        layer.addSublayer(border)
        layer.masksToBounds = true
    }
    
}
