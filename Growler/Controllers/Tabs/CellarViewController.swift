//
//  CellarViewController.swift
//  Growler
//
//  Created by Matt Bush on 1/12/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

class CellarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        QueryClient.sharedClient.fetch(query: BeersQuery()) { (result, error) in
            guard let data = result?.data else { return }
            print(data.beers)
        }
    }

    static func title() -> String { return "Cellar" }

    fileprivate func setupView() {
        title = CellarViewController.title()
        view.backgroundColor = UIColor.orange
    }

}
