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
    let defaults = UserDefaults.standard
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        validateTextFields()
    }
    
    fileprivate func setupView() {
        title = "Log In"
        view.backgroundColor = Style.white
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        Style.addBottomBorder(toLayer: usernameField.layer, onFrame: usernameField.frame, color: Style.gray.cgColor)
        Style.addBottomBorder(toLayer: passwordField.layer, onFrame: passwordField.frame, color: Style.gray.cgColor)
        setupCloseButton()
        setupUsernameField()
        setupPassworldField()
        setupSubmitButton()
    }
    
    @objc fileprivate func dismissKeyboard() { view.endEditing(true) }
    
    fileprivate func setupCloseButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Close"), style: .plain, target: self, action: #selector(close))
    }
    
    fileprivate func setupUsernameField() {
        usernameField.delegate = self
        usernameField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        usernameField.placeholder = "Username"
        usernameField.autocapitalizationType = .none
        usernameField.autocorrectionType = .no
        usernameField.returnKeyType = .next
        view.addSubview(usernameField)
        layoutUsernameField()
    }
    
    fileprivate func setupPassworldField() {
        passwordField.delegate = self
        passwordField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordField.placeholder = "Password"
        passwordField.autocapitalizationType = .none
        passwordField.autocorrectionType = .no
        passwordField.isSecureTextEntry = true
        passwordField.returnKeyType = .go
        view.addSubview(passwordField)
        layoutPasswordField()
    }
    
    fileprivate func setupSubmitButton() {
        submitButton.setBackground(withColor: Style.orange)
        submitButton.setTitle("Log In", color: Style.white, font: Style.semiBoldSansFont(withSize: 16))
        submitButton.addTarget(self, action:#selector(submitTapped), for: .touchUpInside)
        view.addSubview(submitButton)
        layoutSubmitButton()
    }
    
    @objc fileprivate func submitTapped() {
        login(withUsername: usernameField.text, password: passwordField.text)
    }
    
    fileprivate func layoutUsernameField() {
        usernameField.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(60, 20, 0, 0), excludingEdge: .bottom)
    }
    
    fileprivate func layoutPasswordField() {
        passwordField.autoPinEdge(.top, to: .bottom, of: usernameField, withOffset: 30)
        passwordField.autoPinEdge(.leading, to: .leading, of: usernameField)
        passwordField.autoPinEdge(.trailing, to: .trailing, of: usernameField)
    }
    
    fileprivate func layoutSubmitButton() {
        submitButton.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero, excludingEdge: .top)
        submitButton.autoSetDimension(.height, toSize: 50)
    }
    
    fileprivate func login(withUsername username: String?, password: String?) {
        guard let username = username, let password = password else { return /* handle error */ }
        QueryClient.sharedClient().perform(mutation: LoginMutation(input: LoginInput(email: username, password: password))) { [weak self] result, error in
            guard let authToken = result?.data?.login?.user?.fragments.userDetails.authToken else { self?.handleError(error); return }
            self?.defaults.set(authToken, forKey: Constants.kUserAuthTokenKey)
            self?.close()
        }
    }
    
    fileprivate func handleError(_ error: Error?) {
        guard let error = error else { return }
        UIAlertController().showError(withTitle: "Login Failed",
                                      message: "Please ensure your email & password are correct and try again.",
                                      onNavigationController: navigationController,
                                      completion: nil)
        dump(error.localizedDescription)
    }
    
    @objc fileprivate func close() { dismiss(animated: true, completion: nil) }

}

extension LoginViewController: UITextFieldDelegate {
    @objc fileprivate func textFieldDidChange() { validateTextFields() }
    
    fileprivate func validateTextFields() {
        guard let userText = usernameField.text, userText.characters.count > 0,
            let passwordText = passwordField.text, passwordText.characters.count > 0 else { submitButton.isEnabled = false; return }
        submitButton.isEnabled = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            textField.resignFirstResponder()
            login(withUsername: usernameField.text, password: passwordField.text)
        }
        return true
    }
}
