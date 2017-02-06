//
//  BeerCell.swift
//  Growler
//
//  Created by Matt Bush on 1/27/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit
import PureLayout

class BeerCell: UICollectionViewCell {
    
    static let kReuseIdentifier = "BeerCell"
    
    let nameLabel = UILabel()
    let brewerLabel = UILabel()
    let descriptionLabel = UILabel()
    let imageView = UIImageView()
    
    private func styleView() {
        backgroundColor = Style.grayLight
    }
    
    public func configure(viewModel: UserBeerViewModel) {
        styleView()
        setupImageView(withURL: viewModel.beerMediumImage())
        setupNameLabel(withName: viewModel.beerName())
        setupBrewLabel(withBreweryName: viewModel.beerBrewer())
    }
    
    private func setupImageView(withURL url: URL?) {
        guard let url = url, let data = try? Data(contentsOf: url) else { return }
        imageView.image = UIImage(data:data)
        addSubview(imageView)
        layout(imageView: imageView)
    }
    
    private func setupNameLabel(withName name: String) {
        nameLabel.text = name
        addSubview(nameLabel)
        layout(nameLabel: nameLabel)
    }
    
    private func setupBrewLabel(withBreweryName name: String) {
        brewerLabel.text = name
        brewerLabel.numberOfLines = 1
        brewerLabel.lineBreakMode = .byTruncatingTail
        addSubview(brewerLabel)
        layout(brewerLabel: brewerLabel)
    }
    
    private func layout(imageView view: UIImageView) {
        view.autoPinEdge(.leading, to: .leading, of: self, withOffset: 10)
        view.autoPinEdge(.top, to: .leading, of: self, withOffset: 10)
        view.autoSetDimension(.height, toSize: 50)
        view.autoSetDimension(.width, toSize: 50)
    }
    
    private func layout(nameLabel label: UILabel) {
        label.autoPinEdge(.leading, to: .leading, of: imageView)
        label.autoPinEdge(.top, to: .top, of: imageView, withOffset: 5)
    }
    
    private func layout(brewerLabel label: UILabel) {
        label.autoPinEdge(.leading, to: .leading, of: nameLabel)
        label.autoPinEdge(.top, to: .bottom, of: nameLabel)
    }
    
    
}
