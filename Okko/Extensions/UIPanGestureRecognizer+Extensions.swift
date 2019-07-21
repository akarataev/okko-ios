//
//  UIPanGestureRecognizer+Extensions.swift
//  Okko
//
//  Created by Alexey Karataev on 21/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

extension UIPanGestureRecognizer {
    
    var direction: VerticalScrollDirection {
        return yVelocity <= 0 ? .up: .down
    }
    
    var yVelocity: CGFloat {
        return velocity(in: view?.superview).y
    }
    
    var touchPoint: CGPoint {
        return translation(in: view?.superview)
    }
}
