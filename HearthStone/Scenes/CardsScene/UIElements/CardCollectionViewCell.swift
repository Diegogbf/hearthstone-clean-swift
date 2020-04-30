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
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func set(imgUrl: String) {
        imageView.frame = contentView.frame
        imageView.downloadImage(url: imgUrl)
    }
}
