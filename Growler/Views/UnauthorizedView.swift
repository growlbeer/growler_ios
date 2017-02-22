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
    let loginLabel = UILabel()
    let loginButton = UIButton()
    let signupButton = UIButton()
    
    convenience init(alert: String) {
        self.init()
        alertText = alert
        setupView()
    }
    
    fileprivate func setupView() {
        backgroundColor = Style.white
        setupSignupButton()
        setupAlertlabel()
        setupLoginLabel()
        setupLoginButton()
    }
    
    fileprivate func setupSignupButton() {
        signupButton.backgroundColor = Style.orange
        signupButton.clipsToBounds = true
        signupButton.layer.cornerRadius = 25
        signupButton.setTitle("Get Started", for: .normal)
        signupButton.setTitleColor(Style.white, for: .normal)
        signupButton.addTarget(self, action:#selector(signupTapped), for: .touchUpInside)
        addSubview(signupButton)
        layoutSignupButton()
    }
    
    fileprivate func layoutSignupButton() {
        signupButton.autoSetDimension(.height, toSize: 50)
        signupButton.autoPinEdge(toSuperviewEdge: .leading, withInset: 40)
        signupButton.autoPinEdge(toSuperviewEdge: .trailing, withInset: 40)
        signupButton.autoCenterInSuperview()
    }
    
    fileprivate func setupAlertlabel() {
        alertLabel.text = alertText
        alertLabel.numberOfLines = 0
        alertLabel.textAlignment = .center
        alertLabel.font = Style.lightSansFont(withSize: 20)
        addSubview(alertLabel)
        layoutAlertLabel()
    }
    
    fileprivate func layoutAlertLabel() {
        alertLabel.autoPinEdge(.bottom, to: .top, of: signupButton, withOffset: -30)
        alertLabel.autoPinEdge(.leading, to: .leading, of: signupButton)
        alertLabel.autoPinEdge(.trailing, to: .trailing, of: signupButton)
    }
    
    fileprivate func setupLoginLabel() {
        loginLabel.text = "Already have an account?"
        loginLabel.textAlignment = .center
        loginLabel.font = Style.regularSansFont(withSize: 14)
        addSubview(loginLabel)
        layoutLoginLabel()
    }
    
    fileprivate func layoutLoginLabel() {
        loginLabel.autoPinEdge(.top, to: .bottom, of: signupButton, withOffset: 30)
        loginLabel.autoPinEdge(.leading, to: .leading, of: signupButton)
        loginLabel.autoPinEdge(.trailing, to: .trailing, of: signupButton)
    }
    
    fileprivate func setupLoginButton() {
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(Style.orange, for: .normal)
        loginButton.addTarget(self, action:#selector(loginTapped), for: .touchUpInside)
        addSubview(loginButton)
        layoutLoginButton()
    }
    
    fileprivate func layoutLoginButton() {
        loginButton.autoPinEdge(.top, to: .bottom, of: loginLabel, withOffset: 10)
        loginButton.autoAlignAxis(.vertical, toSameAxisOf: signupButton)
    }
    
    @objc fileprivate func loginTapped(sender : UIButton) { /* callback */ }
    
    @objc fileprivate func signupTapped(sender : UIButton) { /* callback */ }

}
