//
//  Filter.swift
//  HearthStone
//
//  Created by Diego Gomes on 28/04/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

protocol CategoryTableViewCellDelegate: class {
    func selectedCategory(data: Cards.FetchCards.Request)
}

class CategoryTableViewCell: UITableViewCell, Reusable {
    static var reuseId: String {
        return String(describing: self)
    }
    
    enum Layout {
        static let nameLeadingDistance: CGFloat = 40
        static let nameTopBottomDistance: CGFloat = 12
        static let collectionLeftInset: CGFloat = 12
    }
    
    private var subCategories = [Home.Card]()
    private var categoryName: String!
    weak var delegate: CategoryTableViewCellDelegate?
    
    // MARK: Components
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FilterTypeCollectionViewCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: Layout.collectionLeftInset, bottom: 0, right: 0)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        configureLayout()
    }
    
    private func configureLayout() {
        contentView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func set(categoryName: String, subCategories: [Home.Card]) {
        self.subCategories = subCategories
        self.categoryName = categoryName
        collectionView.reloadData()
    }
}

// MARK: UICollectionViewDelegate & UICollectionViewDataSource
extension CategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 144, height: 104)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(FilterTypeCollectionViewCell.self, indexPath: indexPath)
        cell.set(card: subCategories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selectedCategory(
            data: Cards.FetchCards.Request(
                category: categoryName,
                subCategory: subCategories[indexPath.item].name
            )
        )
    }
}
