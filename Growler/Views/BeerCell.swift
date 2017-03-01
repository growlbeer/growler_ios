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
    static let cellSize: CGFloat = 120
    
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
        setupBrewerLabel(withBreweryName: viewModel.beerBrewer())
        setupDescriptionLabel(withDescription: viewModel.beerDescription())
    }
    
    private func setupImageView(withURL url: String) {
        imageView.setImage(fromURL: url)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        layout(imageView: imageView)
    }
    
    private func setupNameLabel(withName name: String) {
        nameLabel.text = name
        nameLabel.font = Style.semiBoldSansFont(withSize: 16)
        brewerLabel.numberOfLines = 0
        brewerLabel.lineBreakMode = .byTruncatingTail
        addSubview(nameLabel)
        layout(nameLabel: nameLabel)
    }
    
    private func setupBrewerLabel(withBreweryName name: String) {
        brewerLabel.text = name
        brewerLabel.font = Style.lightSansFont(withSize: 16)
        brewerLabel.numberOfLines = 1
        brewerLabel.lineBreakMode = .byTruncatingTail
        addSubview(brewerLabel)
        layout(brewerLabel: brewerLabel)
    }
    
    private func setupDescriptionLabel(withDescription desc: String) {
        descriptionLabel.text = desc
        descriptionLabel.font = Style.regularSerifFont(withSize: 12)
        descriptionLabel.numberOfLines = 3
        descriptionLabel.lineBreakMode = .byTruncatingTail
        addSubview(descriptionLabel)
        layout(descriptionLabel: descriptionLabel)
    }
    
    private func layout(imageView view: UIImageView) {
        view.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(3, 3, 3, 0), excludingEdge: .trailing)
        view.autoSetDimension(.width, toSize: BeerCell.cellSize)
    }
    
    private func layout(nameLabel label: UILabel) {
        label.autoPinEdge(.leading, to: .trailing, of: imageView, withOffset: 10)
        label.autoPinEdge(.trailing, to: .trailing, of: self, withOffset: -10)
        label.autoPinEdge(.top, to: .top, of: self, withOffset: 10)
    }
    
    private func layout(brewerLabel label: UILabel) {
        label.autoPinEdge(.leading, to: .leading, of: nameLabel)
        label.autoPinEdge(.trailing, to: .trailing, of: nameLabel)
        label.autoPinEdge(.top, to: .bottom, of: nameLabel)
    }
    
    private func layout(descriptionLabel label: UILabel) {
        label.autoPinEdge(.leading, to: .leading, of: brewerLabel)
        label.autoPinEdge(.trailing, to: .trailing, of: brewerLabel)
        label.autoPinEdge(.top, to: .bottom, of: brewerLabel, withOffset: 5)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.removeFromSuperview()
        brewerLabel.removeFromSuperview()
        descriptionLabel.removeFromSuperview()
        imageView.removeFromSuperview()
    }
    
}
