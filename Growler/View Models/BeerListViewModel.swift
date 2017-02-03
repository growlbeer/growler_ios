//
//  BeerListViewModel.swift
//  Growler
//
//  Created by Matt Bush on 1/27/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import Foundation

enum Cellar: Int {
    case all, forTrade, wishlist
}

class BeerListViewModel {
    
    public var render: ((Void) -> Void)? {
        didSet {
            render?()
        }
    }
    
    fileprivate var beers: [CellarQuery.Data.Beer]? {
        didSet { dump(beers); render?() }
    }
    
    init() {
        QueryClient.sharedClient.fetch(query: CellarQuery()){ (result, error) in
            self.beers = result?.data?.beers as? [CellarQuery.Data.Beer]
            dump(self.beers)
        }
    }
    
    public func query(forIndex index: Int) {
        switch index {
        case Cellar.all.rawValue: break
        case Cellar.forTrade.rawValue: break
        case Cellar.wishlist.rawValue: break
        default: break
        }
    }
    
}
