//
//  CellarViewModel.swift
//  Growler
//
//  Created by Matt Bush on 1/27/17.
//  Copyright © 2017 Growler. All rights reserved.
//

enum Cellar: Int {
    case all, forTrade, wishlist
}

class CellarViewModel {
    
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
    
    public func query(forIndex index: Index) {
        switch <#value#> {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
    }
    
}
