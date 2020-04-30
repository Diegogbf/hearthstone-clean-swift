//
//  CardCollectionViewCell.swift
//  HearthStone
//
//  Created by Diego Gomes on 29/04/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell, Reusable {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    // MARK: Components
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        configureLayout()
    }
    
    private func configureLayout() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func set(imgUrl: String) {
        imageView.downloadImage(url: imgUrl)
    }
}
