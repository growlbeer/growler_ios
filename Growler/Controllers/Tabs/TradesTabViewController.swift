//
//  TradesViewController.swift
//  Growler
//
//  Created by Matt Bush on 1/12/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

class TradesTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func title() -> String { return "Trades" }
    
    fileprivate func setupView() {
        title = TradesTabViewController.title()
        view.backgroundColor = UIColor.yellow
    }

}
