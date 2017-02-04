//
//  BeerViewModel.swift
//  Growler
//
//  Created by Matthew Bush on 2/3/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import Foundation
import Apollo

class BeerViewModel {
    
    let beer: CellarQuery.Data.Beer
    let name: String
    let brewer: String
    let descrip: String
    //let imageURL: URL
    
    init(beer: CellarQuery.Data.Beer) {
        self.beer = beer
        self.name = beer.fragments.beerDetails.name!
        self.brewer = "" //beer.breweries.first.name
        self.descrip = "" //beer.description
        //self.imageURL = nil //URL(string: beer.mediumImage)
    }
}
