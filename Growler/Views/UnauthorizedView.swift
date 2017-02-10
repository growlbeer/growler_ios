//
//  UnauthorizedView.swift
//  Growler
//
//  Created by Matt Bush on 2/10/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit
import PureLayout

class UnauthorizedView: UIView {
    
    var alertText: String = "Please log in or sign up to access this content"
    let alertLabel = UILabel()
    let loginButton = UIButton()
    let signupButton = UIButton()
    
    convenience init(alert: String) {
        self.init()
        alertText = alert
        setupView()
    }
    
    fileprivate func setupView() {
        setupAlertlabel()
        setupLoginButton()
        setupSignupButton()
    }
    
    fileprivate func setupAlertlabel() {
        alertLabel.text = alertText
        addSubview(alertLabel)
    }
    
    fileprivate func setupLoginButton() {
        loginButton.setTitle("Log In", for: .normal)
        loginButton.addTarget(self, action:#selector(loginTapped), for: .touchUpInside)
        addSubview(loginButton)
    }
    
    fileprivate func setupSignupButton() {
        signupButton.setTitle("Sign In", for: .normal)
        signupButton.addTarget(self, action:#selector(signupTapped), for: .touchUpInside)
        addSubview(signupButton)
    }
    
    @objc fileprivate func loginTapped(sender : UIButton) { /* callback */ }
    
    @objc fileprivate func signupTapped(sender : UIButton) { /* callback */ }

}
