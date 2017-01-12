//
//  ProfileViewController.swift
//  Growler
//
//  Created by Matt Bush on 1/12/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func title() -> String { return "Profile" }
    
    fileprivate func setupView() {
        title = ProfileViewController.title()
        view.backgroundColor = UIColor.brown
    }
    
}
