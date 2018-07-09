//
//  GalleryDataSource.swift
//  Shortcuts Gallery
//
//  Created by Marco Capano on 09/07/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import Foundation
import UIKit

class GalleryDataSource: NSObject, UITableViewDataSource {
    var shortcuts: [Shortcut]
    
    init(shortcuts: [Shortcut]) {
        self.shortcuts = shortcuts
    }
    
    override init() {
        self.shortcuts = []
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shortcuts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "galleryCell", for: indexPath) as? GalleryTableViewCell else {
            fatalError("unable to load cell in gallery")
        }
        
        let shortcut = shortcuts[indexPath.row]
        cell.titleLabel.text = shortcut.title
        cell.descriptionLabel.text = shortcut.summary
        
        shortcut.detail { (detail) in
            if let detail = detail {
                DispatchQueue.main.async {
                    cell.nameLabel.text = "CREATED BY \(detail.user.name)"
                }
            }
        }
        
        return cell
    }
    
}
