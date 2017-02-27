//
//  BeerListViewModel.swift
//  Growler
//
//  Created by Matt Bush on 1/27/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import Foundation
import Apollo

enum Cellar: Int {
    case all, forTrade, wishlist
}

class BeerListViewModel {

    public var render: ((Void) -> Void)? { didSet { render?() } }
    
    fileprivate var userBeers: [UserBeersQuery.Data.UserBeer] = [] { didSet { render?() } }
    
    init() { query(forIndex: Cellar.all.rawValue) }
    
    public func query(forIndex index: Int) {
        var filterType = "have"
        switch index {
            case Cellar.all.rawValue: filterType = "have"; break
            case Cellar.forTrade.rawValue: filterType = "trade"; break
            case Cellar.wishlist.rawValue: filterType = "want"; break
            default: break
        }
        QueryClient.sharedClient().fetch(query: UserBeersQuery(filterType: filterType)){ [weak self] (result, error) in
            guard let userBeers = result?.data?.userBeers as? [UserBeersQuery.Data.UserBeer] else { return }
            self?.userBeers = userBeers
        }
    }
    
    public func numberOfUserBeers() -> Int { return userBeers.count }
    
    public func cell(forIndexPath indexPath: IndexPath, cell: BeerCell) -> UICollectionViewCell {
        let viewModel = UserBeerViewModel(userBeer: userBeers[indexPath.row])
        cell.configure(viewModel: viewModel)
        return cell
    }
}
