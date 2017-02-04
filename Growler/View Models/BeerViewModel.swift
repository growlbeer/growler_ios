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
    
    let beer: Beer
    let name: String
    let brewer: String
    let descrip: String
    let imageURL: URL
    
    init(beer: Beer) {
        self.beer = beer
        self.name = beer.name
        self.brewer = beer.brewers.first
        self.descrip = beer.description
        self.imageURL = URL(string: beer.mediumImage)
        super.init()
    }
    
}
