//
//  UIImageView+Growler.swift
//  Growler
//
//  Created by Matt Bush on 2/10/17.
//  Copyright © 2017 Growler. All rights reserved.
//

import UIKit

extension UIImageView {
    func setImage(fromURL url: String) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, url, error in
            guard let data = data else { return }
            DispatchQueue.main.async { self.image = UIImage(data: data) }
        })
        task.resume()
    }
}
