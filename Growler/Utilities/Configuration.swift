//
//  Configuration.swift
//  Growler
//
//  Created by Matt Bush on 1/10/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

public final class Configuration {
    
    static func run(_ window: UIWindow?) {
        Style.themeUI()
        let nc = UINavigationController(rootViewController: TabBarController())
        window?.rootViewController = nc
        window?.makeKeyAndVisible()
    }
    
}
