//
//  CellarViewModel.swift
//  Growler
//
//  Created by Matt Bush on 1/27/17.
//  Copyright © 2017 Growler. All rights reserved.
//

class CellarViewModel {
    
    public var render: ((Void) -> Void)? {
        didSet {
            render?()
        }
    }
    
    fileprivate var beers: [Beer]? {
        didSet { dump(beers); render?() }
    }
    
    init() {
        QueryClient.sharedClient.fetch(query: CellarQuery()) { [weak self] result, _ in
            guard let data = result?.data else { return }
            self?.beers = data
        }
    }
    
}
