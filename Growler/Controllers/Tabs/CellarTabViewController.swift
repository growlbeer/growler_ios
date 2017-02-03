//
//  CellarTabViewController.swift
//  Growler
//
//  Created by Matt Bush on 1/12/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit
import PureLayout

class CellarTabViewController: UIViewController {
    
    let beerListVC = BeerListViewController(viewModel: BeerListViewModel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    static func title() -> String { return "Cellar" }

    fileprivate func setupView() {
        title = CellarTabViewController.title()
        view.backgroundColor = Style.white
        setupSegmentedControl()
        // add cellar list vc
    }
    
    fileprivate func setupSegmentedControl() {
        let segControl = UISegmentedControl(items: ["All", "For Trade", "Wishlist"])
        segControl.addTarget(self, action: #selector(setQuery), for: .valueChanged)
        // check to see if gets called before or after target is added
        segControl.selectedSegmentIndex = Cellar.all.rawValue
        view.addSubview(segControl)
        layout(segmentedControl: segControl)
    }
    
    @objc fileprivate func setQuery(sender: UISegmentedControl) {
        beerListVC.viewModel.query(forIndex: sender.selectedSegmentIndex)
    }
    
    fileprivate func layout(segmentedControl segControl: UISegmentedControl) {
        segControl.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        segControl.autoAlignAxis(.vertical, toSameAxisOf: view)
    }

}
