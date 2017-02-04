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
    
    public func numberOfBeers() -> Int { return beers?.count ?? 0 }
    
//    fileprivate func beerViewModel(forBeer beer: CellarQuery.Data.Beer) -> BeerViewModel { return BeerViewModel(beer: beer) }
    
    public func configureCell(forIndexPath indexPath: IndexPath, cell: BeerCell) -> UICollectionViewCell {
        guard let beerDetails = beers?[indexPath.row].fragments.beerDetails else { return cell }
        
        let breweryDetails = beerDetails.breweries?.first??.fragments.breweryDetails
        
        cell.configure(name: beerDetails.name!,
                        brewer: (breweryDetails?.name!)!, // TODO - HAHA LOOK AT THIS
                        descrip: beerDetails.description!,
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
