//
//  GalleryCollectionViewCell.swift
//  Shortcuts Gallery
//
//  Created by Marco Capano on 26/07/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        mainLabel.sizeToFit()
        secondaryLabel.sizeToFit()
        box.sizeToFit()
        
        box.layer.shadowColor = UIColor(red: 151/255, green: 170/255, blue: 186/255, alpha: 0.5).cgColor
        box.layer.shadowRadius = 14.0
        box.layer.shadowOffset = CGSize(width: 0, height: 3)
        box.layer.shadowOpacity = 1.0
        box.layer.cornerRadius = 14
        box.layer.masksToBounds = false
    }

}
