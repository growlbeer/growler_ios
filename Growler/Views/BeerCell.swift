//
//  BeerCell.swift
//  Growler
//
//  Created by Matt Bush on 1/27/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

class BeerCell: UICollectionViewCell {
    
    static let kReuseIdentifier = "BeerCell"
    
    var name: String
    var brewer: String
    var descrip: String
    var imageURL: URL
    
    let nameLabel = UILabel()
    let brewerLabel = UILabel()
    let descriptionLabel = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        name = ""
        brewer = ""
        descrip = ""
        imageURL = URL(string: "")!
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleView() {
        backgroundColor = Style.grayLight
    }
    
    public func configure(viewModel: UserBeerViewModel) {
        name = viewModel.beerName()
        brewer = viewModel.beerBrewer()
        descrip = viewModel.beerDescription()
        imageURL = viewModel.beerMediumImage()
        self.styleView()
        print(name)
    }
    
}
