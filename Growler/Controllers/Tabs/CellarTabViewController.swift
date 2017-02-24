//
//  CellarTabViewController.swift
//  Growler
//
//  Created by Matt Bush on 1/12/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit
import PureLayout

class CellarTabViewController: UIViewController {
    
    let beerListVC = BeerListViewController(viewModel: BeerListViewModel())
    let segControl = UISegmentedControl(items: ["All", "For Trade", "Wishlist"])
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureAuthenticationState()
    }

    static func title() -> String { return "Cellar" }

    fileprivate func setupView() {
        title = CellarTabViewController.title()
        view.backgroundColor = Style.white
        setupSegmentedControl()
    }
    
    fileprivate func configureAuthenticationState() {
        guard let _ = defaults.object(forKey: Constants.kUserAuthTokenKey) else { showUnauthorizedView(); return }
        setupBeerList()
    }
    
    fileprivate func showUnauthorizedView() {
        let unauthedView = UnauthorizedView(alert: "To start adding beers to your cellar you must create an account",
                            loginHandler: { [weak self] _ in LoginViewController.showLogin(withNavigationController: self?.navigationController) },
                            signupHandler: { _ in print("signupTapped") })
        view.addSubview(unauthedView)
        unauthedView.autoPinEdgesToSuperviewEdges()
    }
    
    fileprivate func setupSegmentedControl() {
        segControl.addTarget(self, action: #selector(setQuery), for: .valueChanged)
        segControl.selectedSegmentIndex = Cellar.all.rawValue
        view.addSubview(segControl)
        layout(segmentedControl: segControl)
    }
    
    fileprivate func setupBeerList() {
        addChildViewController(beerListVC)
        beerListVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(beerListVC.view)
        layout(beerListVC: beerListVC)
        beerListVC.didMove(toParentViewController: self)
    }
    
    @objc fileprivate func setQuery(sender: UISegmentedControl) {
        beerListVC.viewModel.query(forIndex: sender.selectedSegmentIndex)
    }
    
    fileprivate func layout(segmentedControl segControl: UISegmentedControl) {
        segControl.autoPinEdge(toSuperviewEdge: .top, withInset: 20)
        segControl.autoAlignAxis(.vertical, toSameAxisOf: view)
    }
    
    fileprivate func layout(beerListVC vc: BeerListViewController) {
        vc.view.autoPinEdge(.top, to: .bottom, of: segControl, withOffset: 20)
        vc.view.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20), excludingEdge: .top)
    }

}
