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
    let beer: BeerDetails?
    let breweries: [BeerDetails.Brewery]?
    
    init(userBeer: UserBeersQuery.Data.UserBeer) {
        self.userBeer = userBeer
        beer = userBeer.beer?.fragments.beerDetails
        breweries = beer?.breweries as? [BeerDetails.Brewery]
    }
    
    public func beerName() -> String { return beer?.name ?? "" }
    public func beerBrewer() -> String { return breweries?.first?.fragments.breweryDetails.name ?? "" }
    public func beerDescription() -> String { return beer?.description ?? "" }
    public func beerMediumImage() -> String { return beer?.mediumImage ?? "" }
    
}
