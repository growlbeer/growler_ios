//
//  BeerViewController.swift
//  Growler
//
//  Created by Mike Cruz on 2/28/17.
//  Copyright © 2017 Growler. All rights reserved.
//
import UIKit

class BeerViewController: UIViewController {
    
    var beer: BeerDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    static func title() -> String { return "Beer" }
    
    fileprivate func setupView() {
        title = BeerViewController.title()
        view.backgroundColor = Style.white
    }
    
    func getBeerDetails(beerId: String) {
        QueryClient.sharedClient().fetch(query: BeerQuery(id: beerId)) { [weak self] result, error in
            guard let beer = result?.data?.beer?.fragments.beerDetails else { dump(error); return }
            self?.beer = beer
        }
    }
}
