//
//  UIPresentationController+Extensions.swift
//  Okko
//
//  Created by Alexey Karataev on 21/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

extension UIPresentationController {
    
    var safeAreaInsets: UIEdgeInsets {
        return presentingViewController.view.safeAreaInsets
    }
}

