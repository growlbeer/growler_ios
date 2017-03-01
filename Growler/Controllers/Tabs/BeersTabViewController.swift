//
//  BeersViewController.swift
//  Growler
//
//  Created by Matt Bush on 1/12/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

class BeersTabViewController: UIViewController {
    
    var beers: [BeerSearchQuery.Data.Search.Beer?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        search(keywords: "candy")
    }
    
    static func title() -> String { return "Beers" }
    
    fileprivate func setupView() {
        title = BeersTabViewController.title()
        view.backgroundColor = Style.white
    }
    
    func search(keywords: String) {
        QueryClient.sharedClient().fetch(query: BeerSearchQuery(q: keywords)) { [weak self] result, error in
            guard let beers = result?.data?.search?.beers else { dump(error); return }
            self?.beers = beers
            print(beers)
        }
    }

}
