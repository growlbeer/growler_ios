//
//  BeerViewModel.swift
//  Growler
//
//  Created by Mike on 2/8/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import Foundation

class BeerViewModel {
    
    let beer: BeerDetails
    let breweries: [BeerDetails.Brewery]
    
    init(beer: BeerDetails) {
        self.beer = beer
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
    
    public func beerMediumImage() -> URL? {
        guard let urlString = beer.mediumImage else { return nil }
        return URL(string: urlString)
    }
}
