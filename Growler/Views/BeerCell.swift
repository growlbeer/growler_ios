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
        print("Creating default Beer Cell")
        self.name = "Default Name"
        self.brewer = "Default Brewer"
        self.descrip = "Default Description"
        self.imageURL = URL(string: "http://48tk9j3a74jb133e1k2fzz2s.wpengine.netdna-cdn.com/wp-content/uploads/2016/09/Ballast-Point-Coconut-Victory-At-Sea-22-Ounce-Bottle-Label-Feature-.jpg")!
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styleView() {
        backgroundColor = Style.grayLight
    }
    
    public func configure(name: String, brewer: String, descrip: String, imageURL: URL) {
        print("Configuring cell", name)
        self.name = name
        self.brewer = brewer
        self.descrip = descrip
        self.imageURL = imageURL
        self.styleView()
    }
    
}
