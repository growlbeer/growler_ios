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
    
    let signInVC = SignInViewController()
    let beerListVC = BeerListViewController(viewModel: BeerListViewModel())
    let segControl = UISegmentedControl(items: ["All", "For Trade", "Wishlist"])
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    static func title() -> String { return "Cellar" }

    fileprivate func setupView() {
        title = CellarTabViewController.title()
        view.backgroundColor = Style.white
        let auth_token = defaults.object(forKey: "auth_token")
        if (auth_token == nil) {
            setupNotLoggedInView()
        } else {
            setupSegmentedControl()
            setupBeerList()
        }
    }
    
    fileprivate func setupNotLoggedInView() {
        print("setupNotLoggedInView")
        let welcomeLabel = UILabel()
        let signupButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
        welcomeLabel.text = "Sorry you're not logged in."
        signupButton.backgroundColor = .black
        signupButton.setTitle("Sign In", for: .normal)
        signupButton.addTarget(self, action:#selector(self.signupButtonClicked), for: .touchUpInside)
        view.addSubview(welcomeLabel)
        view.addSubview(signupButton)
        welcomeLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 50)
        welcomeLabel.autoAlignAxis(.vertical, toSameAxisOf: view)
        signupButton.autoPinEdge(.top, to: .bottom, of: welcomeLabel, withOffset: 50)
        welcomeLabel.autoAlignAxis(.vertical, toSameAxisOf: welcomeLabel)
    }
    
    func signupButtonClicked(sender : UIButton) {
        present(signInVC, animated: true, completion: nil)
        print("Button clicked!")
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
