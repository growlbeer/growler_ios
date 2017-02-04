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
    
    let name: String
    let brewer: String
    let descrip: String
    let imageURL: URL
    
    let nameLabel = UILabel()
    let brewerLabel = UILabel()
    let descriptionLabel = UILabel()
    let imageView = UIImageView()
    
    init(name: String, brewer: String, descrip: String, imageURL: URL) {
        self.name = name
        self.brewer = brewer
        self.descrip = descrip
        self.imageURL = imageURL
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.styleView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleView() {
        backgroundColor = Style.grayLight
    }
    
}
