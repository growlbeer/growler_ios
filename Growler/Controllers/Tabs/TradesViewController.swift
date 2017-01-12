//
//  TradesViewController.swift
//  Growler
//
//  Created by Matt Bush on 1/12/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

class TradesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func title() -> String { return "Trades" }
    
    fileprivate func setupView() {
        title = TradesViewController.title()
        view.backgroundColor = UIColor.yellow
    }

}
