//
//  ProfileViewController.swift
//  Growler
//
//  Created by Matt Bush on 1/12/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

class ProfileTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func title() -> String { return "Profile" }
    
    fileprivate func setupView() {
        title = ProfileTabViewController.title()
        view.backgroundColor = Style.white
        
        let logoutButton = UIButton()
        logoutButton.backgroundColor = .orange
        logoutButton.setTitle("Sign Out", for: .normal)
        logoutButton.addTarget(self, action:#selector(self.logoutButtonClicked), for: .touchUpInside)
        view.addSubview(logoutButton)
        logoutButton.autoPinEdge(toSuperviewEdge: .top, withInset: 50)
        logoutButton.autoAlignAxis(.vertical, toSameAxisOf: view)
    }
    
    func logoutButtonClicked() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "auth_token")
        
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name(rawValue: "user"),
                object: nil,
                userInfo:["event":"logout"])
        self.navigationController?.popViewController(animated: true)
    }
    
}
