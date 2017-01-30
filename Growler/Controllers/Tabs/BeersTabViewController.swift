//
//  BeersViewController.swift
//  Growler
//
//  Created by Matt Bush on 1/12/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

class BeersTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func title() -> String { return "Beers" }
    
    fileprivate func setupView() {
        title = BeersTabViewController.title()
        view.backgroundColor = Style.white
    }

}
