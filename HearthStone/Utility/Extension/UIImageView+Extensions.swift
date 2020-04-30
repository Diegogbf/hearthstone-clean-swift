//
//  UIImage+DownloadImage.swift
//  Zap Challenge
//
//  Created by Diego Gomes on 21/01/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

private var cache = ImageCache()

extension UIImageView {
    
    private func getImagetData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(url: String?) {
        image = nil
        
        if let stringUrl = url, let url = URL(string: stringUrl) {
            if let image = cache[url] {
                self.image = image
                return
            }
            
            let indicator = UIActivityIndicatorView()
            addSubview(indicator)
            center = indicator.center
            indicator.startAnimating()
            
            getImagetData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() {
                    indicator.stopAnimating()
                    indicator.removeFromSuperview()
                    self.image = UIImage(data: data)
                    cache[url] = UIImage(data: data)
                }
            }
        }
    }
}


