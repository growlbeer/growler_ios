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
    let brewer: String
    let descrip: String
    let imageURL: URL
    
    let nameLabel = UILabel()
    let brewerLabel = UILabel()
    let descriptionLabel = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        self.name = "name"
        self.brewer = "brewer"
        self.descrip = "description"
        self.imageURL = URL(string: "http://48tk9j3a74jb133e1k2fzz2s.wpengine.netdna-cdn.com/wp-content/uploads/2016/09/Ballast-Point-Coconut-Victory-At-Sea-22-Ounce-Bottle-Label-Feature-.jpg")!
        super.init(frame: frame)
    }
    
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
