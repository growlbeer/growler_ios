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
        view.backgroundColor = Style.brown
        print("In SigninViewController")
        
        let usernameField = UITextField()
        let passwordField = UITextField()
        let submitButton = UIButton()
        
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(submitButton)
        
        usernameField.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        passwordField.autoPinEdge(.top, to: .bottom, of: usernameField)
        submitButton.autoPinEdge(.top, to: .bottom, of: passwordField)
    }
}
