//
//  NSObject+Extensions.swift
//  Okko
//
//  Created by Alexey Karataev on 20/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

protocol Designable {}
extension NSObject: Designable {}

typealias Style<UIComponent> = (UIComponent) -> Void

enum DesignSystem<UIComponent> {
    case container(style: Style<UIComponent>)
}

extension Designable {
    func apply(_ styles: DesignSystem<Self>...) {
        styles.forEach { switch $0
            { case .container(let style): style(self) }
        }
    }
}

