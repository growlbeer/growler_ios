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
    }
    
}
