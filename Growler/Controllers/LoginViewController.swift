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
    
    fileprivate let usernameField = UITextField()
    fileprivate let passwordField = UITextField()
    fileprivate let submitButton = UIButton()
    
    static func showLogin(withNavigationController navVC: UINavigationController?) {
        guard let navVC = navVC else { return }
        let nav = UINavigationController(rootViewController: LoginViewController.sharedInstance)
        navVC.present(nav, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    fileprivate func setupView() {
        title = "Log In"
        view.backgroundColor = Style.white
        setupCloseButton()
        setupUsernameField()
        setupPassworldField()
        setupSubmitButton()
    }
    
    fileprivate func setupCloseButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Close"), style: .plain, target: self, action: #selector(close))
    }
    
    fileprivate func setupUsernameField() {
        usernameField.placeholder = "Username"
        view.addSubview(usernameField)
        layoutUsernameField()
    }
    
    fileprivate func setupPassworldField() {
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
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
        login(withUsername: usernameField.text, password: passwordField.text)
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
        submitButton.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero, excludingEdge: .top)
        submitButton.autoSetDimension(.height, toSize: 50)
    }
    
    fileprivate func login(withUsername username: String?, password: String?) {
        guard let username = username, let password = password else { return /* handle error */ }
        // handle login
    }
    
    @objc fileprivate func close() { dismiss(animated: true, completion: nil) }

}
