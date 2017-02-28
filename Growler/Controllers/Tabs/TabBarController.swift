//
//  TabBarController.swift
//  Growler
//
//  Created by Matt Bush on 1/12/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setupTabBar()
    }
    
    fileprivate func setupTabBar() {
        let cellarVC    = UINavigationController(rootViewController: CellarTabViewController())
        let tradesVC    = UINavigationController(rootViewController: TradesTabViewController())
        let beersVC     = UINavigationController(rootViewController: BeersTabViewController())
        let profileVC   = UINavigationController(rootViewController: ProfileTabViewController())
    
        let cellarBarItem   = UITabBarItem(title: CellarTabViewController.title(),
                                           image: #imageLiteral(resourceName: "Cellar").withRenderingMode(.alwaysOriginal),
                                           selectedImage: #imageLiteral(resourceName: "CellarSelected").withRenderingMode(.alwaysOriginal))
        let tradesBarItem   = UITabBarItem(title: TradesTabViewController.title(),
                                           image: #imageLiteral(resourceName: "Trade").withRenderingMode(.alwaysOriginal),
                                           selectedImage: #imageLiteral(resourceName: "TradeSelected").withRenderingMode(.alwaysOriginal))
        let beersBarItem    = UITabBarItem(title: BeersTabViewController.title(),
                                           image: #imageLiteral(resourceName: "Search").withRenderingMode(.alwaysOriginal),
                                           selectedImage: #imageLiteral(resourceName: "SearchSelected").withRenderingMode(.alwaysOriginal))
        let profileBarItem  = UITabBarItem(title: ProfileTabViewController.title(),
                                           image: #imageLiteral(resourceName: "Profile").withRenderingMode(.alwaysOriginal),
                                           selectedImage: #imageLiteral(resourceName: "ProfileSelected").withRenderingMode(.alwaysOriginal))
        
        cellarVC.tabBarItem     = cellarBarItem
        tradesVC.tabBarItem     = tradesBarItem
        beersVC.tabBarItem      = beersBarItem
        profileVC.tabBarItem    = profileBarItem
        
        viewControllers = [cellarVC, tradesVC, beersVC, profileVC]
    }

}

extension TabBarController {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

    }
}
