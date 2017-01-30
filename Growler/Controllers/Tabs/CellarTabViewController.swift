//
//  CellarTabViewController.swift
//  Growler
//
//  Created by Matt Bush on 1/12/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit
import PureLayout

enum Cellar: Int {
    case all, forTrade, wishlist
}

class CellarTabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    static func title() -> String { return "Cellar" }

    fileprivate func setupView() {
        title = CellarTabViewController.title()
        view.backgroundColor = Style.white
        setupSegmentedControl()
    }
    
    fileprivate func setupSegmentedControl() {
        let segControl = UISegmentedControl(items: ["All", "For Trade", "Wishlist"])
        segControl.selectedSegmentIndex = Cellar.all.rawValue
        segControl.addTarget(self, action: #selector(setView), for: .valueChanged)
        view.addSubview(segControl)
        layout(segmentedControl: segControl)
    }
    
    @objc fileprivate func setView(sender: UISegmentedControl) {
        setVC(index: sender.selectedSegmentIndex)
    }
    
    fileprivate func setVC(index: Int) {
        switch index {
        case Cellar.all.rawValue: break // set in container CellarListViewController(viewModel: CellarViewModel())
        case Cellar.forTrade.rawValue: break
        case Cellar.wishlist.rawValue: break
        default: break
        }
    }
    
    fileprivate func layout(segmentedControl segControl: UISegmentedControl) {
        segControl.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        segControl.autoAlignAxis(.vertical, toSameAxisOf: view)
    }

}
