//
//  UICollectionViewExtension.swift
//  Shortcuts Gallery
//
//  Created by Marco Capano on 29/07/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

extension UICollectionView {
    func add(refreshControl: UIRefreshControl, target: Any?, selector: Selector) {
        refreshControl.addTarget(target, action: selector, for: .valueChanged)
        self.refreshControl = refreshControl
    }
}
