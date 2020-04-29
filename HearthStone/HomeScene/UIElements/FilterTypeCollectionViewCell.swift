//
//  FilterTypeCollectionViewCell.swift
//  HearthStone
//
//  Created by Diego Gomes on 25/04/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

class FilterTypeCollectionViewCell: UICollectionViewCell, Reusable {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    enum Layout {
        static let nameLeadingTrailingDistance: CGFloat = 24
        static let nameBottomDistance: CGFloat = 16
        static let filterViewRadius: CGFloat = 16
    }
    
    // MARK: Components
    private lazy var filterView: UIView = {
        let filterView = UIView()
        filterView.translatesAutoresizingMaskIntoConstraints = false
        filterView.clipsToBounds = true
        filterView.layer.cornerRadius = Layout.filterViewRadius
        return filterView
    }()
    
    private lazy var filterNameLabel: UILabel = {
        let filterNameLabel = UILabel()
        filterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        filterNameLabel.textColor = .white
        return filterNameLabel
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        configureLayout()
    }
    
    private func configureLayout() {
        contentView.addSubview(filterView)
        NSLayoutConstraint.activate([
            filterView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            filterView.topAnchor.constraint(equalTo: self.topAnchor),
            filterView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            filterView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        filterView.addSubview(filterNameLabel)
        NSLayoutConstraint.activate([
            filterNameLabel.leadingAnchor.constraint(equalTo: filterView.leadingAnchor, constant: Layout.nameLeadingTrailingDistance),
            filterNameLabel.topAnchor.constraint(equalTo: filterView.topAnchor),
            filterNameLabel.trailingAnchor.constraint(equalTo: filterView.trailingAnchor, constant: Layout.nameLeadingTrailingDistance)
        ])
    }
    
    func set(card: Home.Card) {
        filterNameLabel.text = card.name
        filterView.backgroundColor = card.color
    }
}
