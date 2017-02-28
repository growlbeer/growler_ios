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
        
        let cellarImage  = UIImage(named: "Cellar")
        let tradesImage  = UIImage(named: "Trade")
        let beersImage   = UIImage(named: "Search")
        let profileImage = UIImage(named: "Profile")
        
        let cellarBarItem   = UITabBarItem(title: CellarTabViewController.title(), image: cellarImage, selectedImage: cellarImage)
        let tradesBarItem   = UITabBarItem(title: TradesTabViewController.title(), image: tradesImage, selectedImage: tradesImage)
        let beersBarItem    = UITabBarItem(title: BeersTabViewController.title(), image: beersImage, selectedImage: beersImage)
        let profileBarItem  = UITabBarItem(title: ProfileTabViewController.title(), image: profileImage, selectedImage: profileImage)
        
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
