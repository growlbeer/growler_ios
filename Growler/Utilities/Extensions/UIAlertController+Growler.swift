//
//  UIAlertController+Growler.swift
//  Growler
//
//  Created by Matt Bush on 2/28/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    func showError(withTitle title: String?,
                   message: String,
                   onNavigationController nav: UINavigationController?,
                   buttonTitle: String = "Okay",
                   completion: (() -> Void)?) {
        
        let alert = UIAlertController(title: title ?? "Error", message: message, preferredStyle: .alert)
        alert.addAction(primaryAlertAction(title: buttonTitle, style: .default, handler: { [weak self] _ in self?.dismiss(animated: true) }))
        alert.setValue(attributedTitle(string: title ?? "Error"), forKey: "attributedTitle")
        alert.setValue(attributedMessage(string: message), forKey: "attributedMessage")
        style(alert: alert)
        nav?.present(alert, animated: true, completion: completion)
    }
    
    fileprivate func attributedTitle(string: String) -> NSMutableAttributedString {
        var mutableTitle = NSMutableAttributedString()
        mutableTitle = NSMutableAttributedString(string: string, attributes: [
            NSFontAttributeName: Style.semiBoldSansFont(withSize: 18),
            NSForegroundColorAttributeName: Style.black
        ])
        return mutableTitle
    }
    
    fileprivate func attributedMessage(string: String) -> NSMutableAttributedString {
        var mutableMessage = NSMutableAttributedString()
        mutableMessage = NSMutableAttributedString(string: string, attributes: [
            NSFontAttributeName: Style.regularSansFont(withSize: 12),
            NSForegroundColorAttributeName: Style.gray
        ])
        return mutableMessage
    }
    
    fileprivate func style(alert: UIAlertController) {
        let contentView = alert.view.subviews.first?.subviews.first
        contentView?.backgroundColor = Style.white
        contentView?.layer.cornerRadius = 0
    }
    
    fileprivate func primaryAlertAction(title: String, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: .default, handler: handler)
        action.setValue(Style.orange, forKey: "titleTextColor")
        return action
    }
}
