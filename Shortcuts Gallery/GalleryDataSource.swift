//
//  GalleryDataSource.swift
//  Shortcuts Gallery
//
//  Created by Marco Capano on 09/07/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import Foundation
import UIKit

class GalleryDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var shortcuts: [Shortcut]
    var details = [String: ShortcutDetail]()

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
        
        if let detail = details[shortcut.id!] {
            cell.nameLabel.text = "CREATED BY \(detail.user.name)"
        } else {
            shortcut.detail { (detail) in
                self.details[shortcut.id!] = detail
                
                if let detail = detail {
                    DispatchQueue.main.async {
                        cell.nameLabel.text = "CREATED BY \(detail.user.name)"
                    }
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shortcut = shortcuts[indexPath.row]
        
        if let detail = details[shortcut.id!] {
            let deepLink = URL(string: detail.deepLink)
            UIApplication.shared.open(deepLink!, options: [:], completionHandler: nil)
        } else {
            shortcut.detail { (detail) in
                if let detail = detail, let deepLink = URL(string: detail.deepLink) {
                    self.details[shortcut.id!] = detail
                    UIApplication.shared.open(deepLink, options: [:], completionHandler: nil)
                }
            }
        }
    }
    
}
