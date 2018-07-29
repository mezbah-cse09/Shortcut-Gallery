//
//  UIViewControllerExtension.swift
//  Shortcuts Gallery
//
//  Created by Marco Capano on 29/07/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

extension UIViewController {
    func goLargeTitle(text: String) {
        title = text
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    enum BarButtonPosition {
        case left
        case right
    }
    
    func add(button: UIButton, position: BarButtonPosition, selector: Selector) {
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        if position == .left {
            var items = navigationItem.leftBarButtonItems ?? []
            items.append(UIBarButtonItem(customView: button))
            navigationItem.leftBarButtonItems = items
        } else {
            var items = navigationItem.rightBarButtonItems ?? []
            items.append(UIBarButtonItem(customView: button))
            navigationItem.rightBarButtonItems = items
        }
    }
}
