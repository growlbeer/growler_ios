//
//  LoginViewController.swift
//  Growler
//
//  Created by Mike on 2/7/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit
import PureLayout

class LoginViewController: UIViewController {
    
    static let sharedInstance = LoginViewController()
    
    let usernameField = UITextField()
    let passwordField = UITextField()
    let submitButton = UIButton()
    
    static func showLogin(withNavigationController navVC: UINavigationController?) {
        guard let navVC = navVC else { return }
        navVC.present(LoginViewController.sharedInstance, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        title = "Log In"
        view.backgroundColor = Style.white
        setupUsernameField()
        setupPassworldField()
        setupSubmitButton()
    }
    
    fileprivate func setupUsernameField() {
        usernameField.borderStyle = .line
        usernameField.placeholder = "Username"
        view.addSubview(usernameField)
        layoutUsernameField()
    }
    
    fileprivate func setupPassworldField() {
        passwordField.borderStyle = .line
        passwordField.placeholder = "Password"
        view.addSubview(passwordField)
        layoutPasswordField()
    }
    
    fileprivate func setupSubmitButton() {
        submitButton.setTitle("Log In", for: .normal)
        submitButton.backgroundColor = Style.orange
        submitButton.addTarget(self, action:#selector(submitTapped), for: .touchUpInside)
        view.addSubview(submitButton)
        layoutSubmitButton()
    }
    
    @objc fileprivate func submitTapped() {
        print("submit tapped")
    }
    
    fileprivate func layoutUsernameField() {
        usernameField.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(40, 20, 0, 40), excludingEdge: .bottom)
    }
    
    fileprivate func layoutPasswordField() {
        passwordField.autoPinEdge(.top, to: .bottom, of: usernameField, withOffset: 20)
        passwordField.autoPinEdge(.leading, to: .leading, of: usernameField)
        passwordField.autoPinEdge(.trailing, to: .trailing, of: usernameField)
    }
    
    fileprivate func layoutSubmitButton() {
        submitButton.autoPinEdge(.top, to: .bottom, of: passwordField, withOffset: 20)
        submitButton.autoPinEdge(.leading, to: .leading, of: usernameField)
        submitButton.autoPinEdge(.trailing, to: .trailing, of: usernameField)
        submitButton.autoSetDimension(.height, toSize: 50)
    }

}
