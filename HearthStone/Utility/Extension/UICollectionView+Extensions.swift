//
//  UICollectionView+Extensions.swift
//  HearthStone
//
//  Created by Diego Gomes on 25/04/20.
//  Copyright © 2020 Diego Gomes. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ cell: T.Type) where T:Reusable {
        register(cell.self, forCellWithReuseIdentifier: T.reuseId)
    }
    
}
