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
    
    public var render: ((Void) -> Void)? {
        didSet { render?() }
    }
    
    fileprivate var beers: [UserBeersQuery.Data.UserBeer.Beer]? {
        didSet { render?() }
    }
    
    init() {
        query(forIndex: Cellar.all.rawValue)
    }
    
    public func query(forIndex index: Int) {
        var filterType = "have"
        switch index {
            case Cellar.all.rawValue: filterType = "have"; break
            case Cellar.forTrade.rawValue: filterType = "trade"; break
            case Cellar.wishlist.rawValue: filterType = "want"; break
            default: break
        }
        QueryClient.sharedClient.fetch(query: UserBeersQuery(filterType: filterType)){ (result, error) in
            let userBeers = result?.data?.userBeers as! [UserBeersQuery.Data.UserBeer]
            let temp = userBeers.map({$0.beer! as UserBeersQuery.Data.UserBeer.Beer})
            self.beers = temp
        }
    }
    
    public func numberOfBeers() -> Int { return beers?.count ?? 0 }
    
//    fileprivate func beerViewModel(forBeer beer: CellarQuery.Data.Beer) -> BeerViewModel { return BeerViewModel(beer: beer) }
    
    public func configureCell(forIndexPath indexPath: IndexPath, cell: BeerCell) -> UICollectionViewCell {
        guard let beerDetails = beers?[indexPath.row].fragments.beerDetails else { return cell }
        
        let breweryDetails = beerDetails.breweries?.first??.fragments.breweryDetails
        
        cell.configure(name: beerDetails.name!,
                        brewer: (breweryDetails?.name!)!, // TODO - HAHA LOOK AT THIS
                        descrip: beerDetails.description ?? "This shouldn't be nil",
                        imageURL: URL(string: beerDetails.mediumImage ?? "http://48tk9j3a74jb133e1k2fzz2s.wpengine.netdna-cdn.com/wp-content/uploads/2016/09/Ballast-Point-Coconut-Victory-At-Sea-22-Ounce-Bottle-Label-Feature-.jpg")!)
        return cell
    }
    
//    public func cell(forIndexPath indexPath: IndexPath) -> UICollectionViewCell {
//        guard let beer = beers?[indexPath.row] else { return UICollectionViewCell() }
//        let viewModel = beerViewModel(forBeer: beer)
//        return BeerCell(name: viewModel.name,
//                            brewer: viewModel.brewer,
//                            descrip: viewModel.descrip,
//                            imageURL: URL(string: "http://48tk9j3a74jb133e1k2fzz2s.wpengine.netdna-cdn.com/wp-content/uploads/2016/09/Ballast-Point-Coconut-Victory-At-Sea-22-Ounce-Bottle-Label-Feature-.jpg")!
//        )
        //viewModel.imageURL)
//        return BeerCell(name: "Coconut Victory at Sea",
//                        brewer: "Ballast Point",
//                        descrip: "Some shit about coconuts",
//                        imageURL: URL(string: "http://48tk9j3a74jb133e1k2fzz2s.wpengine.netdna-cdn.com/wp-content/uploads/2016/09/Ballast-Point-Coconut-Victory-At-Sea-22-Ounce-Bottle-Label-Feature-.jpg")!)
//    }
    
}
