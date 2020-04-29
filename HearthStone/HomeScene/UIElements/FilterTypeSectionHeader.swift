//
//  Filter.swift
//  HearthStone
//
//  Created by Diego Gomes on 28/04/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class FilterTypeSectionHeader: UICollectionReusableView, Reusable {
    static var reuseId: String {
        return String(describing: self)
    }
    
    enum Layout {
        static let nameLeadingDistance: CGFloat = 40
        static let nameTopBottomDistance: CGFloat = 12
    }
    
    // MARK: Components
    lazy var typeNameLabel: UILabel = {
        let typeNameLabel = UILabel()
        typeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        typeNameLabel.textAlignment = .left
        typeNameLabel.textColor = .gray
        return typeNameLabel
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        configureLayout()
    }
    
    private func configureLayout() {
        addSubview(typeNameLabel)
        NSLayoutConstraint.activate([
            typeNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Layout.nameLeadingDistance),
            typeNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: Layout.nameTopBottomDistance),
            typeNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            typeNameLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: Layout.nameTopBottomDistance)
        ])
    }
}
