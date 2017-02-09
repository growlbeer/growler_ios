//
//  BeerViewModel.swift
//  Growler
//
//  Created by Matthew Bush on 2/3/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import Foundation

class UserBeerViewModel: BeerViewModel {
    
    let userBeer: UserBeersQuery.Data.UserBeer
    
    init(userBeer: UserBeersQuery.Data.UserBeer) {
        self.userBeer = userBeer
        super.init(beer: (userBeer.beer?.fragments.beerDetails)!)
    }
}
