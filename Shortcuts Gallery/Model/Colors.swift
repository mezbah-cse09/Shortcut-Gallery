//
//  Colors.swift
//  Shortcuts Gallery
//
//  Created by Marco Capano on 26/07/2018.
//  Copyright © 2018 Marco Capano. All rights reserved.
//

import UIKit

struct Colors {
    static var colors = [
        UIColor(red: 62/255, green: 118/255, blue: 235/255, alpha: 1.0),
        UIColor(red: 215/255, green: 78/255, blue: 78/255, alpha: 1.0),
        UIColor(red: 205/255, green: 121/255, blue: 170/255, alpha: 1.0),
        UIColor(red: 114/255, green: 180/255, blue: 175/255, alpha: 1.0),
        UIColor(red: 221/255, green: 103/255, blue: 73/255, alpha: 1.0),
        UIColor(red: 163/255, green: 114/255, blue: 221/255, alpha: 1.0),
        UIColor(red: 150/255, green: 212/255, blue: 68/255, alpha: 1.0),
        UIColor(red: 247/255, green: 170/255, blue: 135/255, alpha: 1.0),
        UIColor(red: 228/255, green: 103/255, blue: 158/255, alpha: 1.0),
        UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1.0)
    ]
    
    private static var lastColor = UIColor.clear
    
    //Private init to avoid misuse.
    private init() {}
    
    /// Returns a random color from the color palette.
    static func random() -> UIColor {
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        let color = colors[randomIndex]
        
        if color == lastColor {
            return random()
        } else {
            lastColor = color
            return color
        }
    }
}
