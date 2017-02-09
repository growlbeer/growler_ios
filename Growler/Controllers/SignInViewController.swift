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
    let usernameField = UITextField()
    let passwordField = UITextField()
    let submitButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func title() -> String { return "Sign In" }
    
    fileprivate func setupView() {
        title = SignInViewController.title()
        view.backgroundColor = Style.white
        
        usernameField.borderStyle = .line
        usernameField.autocapitalizationType = UITextAutocapitalizationType.none
        usernameField.placeholder = "Username"
        passwordField.borderStyle = .line
        passwordField.placeholder = "Password"
        passwordField.autocapitalizationType = UITextAutocapitalizationType.none
        //passwordField.isSecureTextEntry = true
        submitButton.setTitle("Sign In", for: .normal)
        submitButton.backgroundColor = Style.orange
        submitButton.addTarget(self, action:#selector(self.submitButtonClicked), for: .touchUpInside)
        
        view.addSubview(usernameField)
        view.addSubview(passwordField)
        view.addSubview(submitButton)
        
        usernameField.autoPinEdge(.top, to: .top, of: view, withOffset: 40)
        usernameField.autoPinEdge(.leading, to: .leading, of: view, withOffset: 20)
        usernameField.autoPinEdge(.trailing, to: .trailing, of: view, withOffset: -20)
        
        passwordField.autoPinEdge(.top, to: .bottom, of: usernameField, withOffset: 20)
        passwordField.autoPinEdge(.leading, to: .leading, of: usernameField)
        passwordField.autoPinEdge(.trailing, to: .trailing, of: usernameField)
        
        submitButton.autoPinEdge(.top, to: .bottom, of: passwordField, withOffset: 20)
        submitButton.autoPinEdge(.leading, to: .leading, of: passwordField)
        submitButton.autoPinEdge(.trailing, to: .trailing, of: passwordField)
        submitButton.autoSetDimension(.height, toSize: 50)
    }
    
    func submitButtonClicked() {
        QueryClient.sharedClient().perform(mutation: LoginMutation(input: LoginInput(email: usernameField.text!, password: passwordField.text!))) { (result, error) in
            let authToken = result?.data?.login?.user?.authToken
            let defaults = UserDefaults.standard
            defaults.set(authToken, forKey: "auth_token")
            
            let nc = NotificationCenter.default
            nc.post(name: Notification.Name(rawValue: "user"),
                    object: nil,
                    userInfo:["event":"login"])
            self.navigationController?.popViewController(animated: true)
            
        }
    }
}
