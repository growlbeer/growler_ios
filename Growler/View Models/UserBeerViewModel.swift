//
//  BeerViewModel.swift
//  Growler
//
//  Created by Matthew Bush on 2/3/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import Foundation
import Apollo

class UserBeerViewModel {
    
    let userBeer: UserBeersQuery.Data.UserBeer
    let beer: BeerDetails
    let breweries: [BeerDetails.Brewery]
    
    init(userBeer: UserBeersQuery.Data.UserBeer) {
        self.userBeer = userBeer
        beer = (userBeer.beer?.fragments.beerDetails)! // TODO - ??
        breweries = beer.breweries! as! [BeerDetails.Brewery]
    }
    
    public func beerName() -> String {
        return beer.name!
    }
    
    public func beerBrewer() -> String {
        return (breweries.first?.fragments.breweryDetails.name)!
    }
    
    public func beerDescription() -> String {
        return beer.description!
    }
    
    public func beerMediumImage() -> URL {
        return URL(string: beer.mediumImage ?? "http://48tk9j3a74jb133e1k2fzz2s.wpengine.netdna-cdn.com/wp-content/uploads/2016/09/Ballast-Point-Coconut-Victory-At-Sea-22-Ounce-Bottle-Label-Feature-.jpg")!
    }
}
