//
//  UIColor+Extensions.swift
//  Okko
//
//  Created by Alexey Karataev on 21/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var random: UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}

