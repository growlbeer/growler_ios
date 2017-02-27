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
        viewModel.render = { [weak self] _ in self?.collectionView?.reloadData() }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    fileprivate func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: view.frame.width - 20, height: BeerCell.cellSize)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = Style.white
        registerCells(forCollectionView: collectionView)
        view.addSubview(collectionView)
        layoutCollectionView()
    }
    
    fileprivate func layoutCollectionView() {
        collectionView?.autoPinEdgesToSuperviewEdges()
    }
    
    fileprivate func registerCells(forCollectionView collectionView: UICollectionView) {
        collectionView.register(BeerCell.self, forCellWithReuseIdentifier: BeerCell.kReuseIdentifier)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfUserBeers()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeerCell.kReuseIdentifier, for: indexPath) as? BeerCell else { return UICollectionViewCell() }
        return viewModel.cell(forIndexPath: indexPath, cell: cell)
    }
}
