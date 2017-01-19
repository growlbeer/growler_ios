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
        let cellarVC    = CellarViewController()
        let tradesVC    = TradesViewController()
        let beersVC     = BeersViewController()
        let profileVC   = ProfileViewController()
        
        let cellarBarItem   = UITabBarItem(title: CellarViewController.title(), image: nil, selectedImage: nil)
        let tradesBarItem   = UITabBarItem(title: TradesViewController.title(), image: nil, selectedImage: nil)
        let beersBarItem    = UITabBarItem(title: BeersViewController.title(), image: nil, selectedImage: nil)
        let profileBarItem  = UITabBarItem(title: ProfileViewController.title(), image: nil, selectedImage: nil)
        
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
