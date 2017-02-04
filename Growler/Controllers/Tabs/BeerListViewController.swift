//
//  BeerListViewController.swift
//  Growler
//
//  Created by Matt Bush on 1/27/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

class BeerListViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    let viewModel: BeerListViewModel
    var collectionView: UICollectionView?
    
    init(viewModel: BeerListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.render = { [weak self] _ in print("view model render complete"); self?.collectionView?.reloadData() }
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 120)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = Style.orange
        registerCells(forCollectionView: collectionView)
        view.addSubview(collectionView)
    }
    
    fileprivate func registerCells(forCollectionView collectionView: UICollectionView) {
        collectionView.register(BeerCell.self, forCellWithReuseIdentifier: BeerCell.kReuseIdentifier)
    }

}

extension BeerListViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfBeers()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeerCell.kReuseIdentifier, for: indexPath) as! BeerCell
        cell.name = viewModel.beerAt(forIndexPath: indexPath).fragments.beerDetails.name!
        return cell
    }
}
