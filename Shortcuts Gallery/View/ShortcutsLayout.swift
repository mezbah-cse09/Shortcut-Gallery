//
//  ShortcutsLayout.swift
//  Shortcuts Gallery
//
//  Created by Marco Capano on 26/07/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

class ShortcutsLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let cv = collectionView else { return }
        
//        let availableWidth = cv.bounds.inset(by: cv.layoutMargins).size.width
        let availableWidth = UIEdgeInsetsInsetRect(cv.bounds, cv.layoutMargins).size.width
        
        let minColumnWidth = CGFloat(290)
        let maxNumColumns = (availableWidth / minColumnWidth).rounded(.toNearestOrEven)
        let cellWidth = (availableWidth / CGFloat(maxNumColumns)).rounded(.down)
        
        self.itemSize = CGSize(width: cellWidth, height: 180)
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0, bottom: 0, right: 0)
        self.sectionInsetReference = .fromSafeArea
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
