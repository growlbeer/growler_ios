//
//  SignInViewController.swift
//  Growler
//
//  Created by Mike on 2/7/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit
import PureLayout

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func title() -> String { return "Sign In" }
    
    fileprivate func setupView() {
        title = SignInViewController.title()
        view.backgroundColor = Style.white
        
        let usernameField = UITextField()
        let passwordField = UITextField()
        let submitButton = UIButton()
        
        usernameField.borderStyle = .line
        usernameField.placeholder = "Username"
        passwordField.borderStyle = .line
        passwordField.placeholder = "Password"
        submitButton.setTitle("Sign In", for: .normal)
        submitButton.addTarget(self, action:#selector(self.submitButtonClicked), for: .touchUpInside)
        
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(submitButton)
        
        usernameField.autoPinEdge(.top, to: .top, of: view, withOffset: 40)
        usernameField.autoPinEdge(.leading, to: .leading, of: view, withOffset: 20)
        usernameField.autoPinEdge(.trailing, to: .trailing, of: view, withOffset: -20)
        
        passwordField.autoPinEdge(.top, to: .bottom, of: usernameField, withOffset: 20)
        passwordField.autoPinEdge(.leading, to: .leading, of: usernameField)
        
        submitButton.autoPinEdge(.top, to: .bottom, of: passwordField, withOffset: 20)
    }
    
    func submitButtonClicked() {
        print("Submit button clicked")
    }
}
