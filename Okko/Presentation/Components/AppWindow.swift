//
//  AppWindow.swift
//  Okko
//
//  Created by Alexey Karataev on 20/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

final class AppWindow: UIWindow {
    
    static var safeAreaInsets: UIEdgeInsets? {
        let window = UIApplication.shared.keyWindow
        return window?.safeAreaInsets
    }
    
    static var frame: CGRect {
        return UIScreen.main.bounds
    }
    
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
