//
//  MainViewStyles.swift
//  Okko
//
//  Created by Alexey Karataev on 22/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func applyMainViewControllerStyles() {
        applyNavigationBarStyle()
        applyMainViewStyle()
    }
    
    func applyNavigationBarStyle() {
        navigationController?.navigationBar.apply(.mainNavigationBarStyle)
    }
    
    func applyMainViewStyle() {
        view.apply(.mainViewStyle)
    }
}


fileprivate extension DesignSystem where UIComponent == UINavigationBar {
    
    static var mainNavigationBarStyle: DesignSystem {
        return .container { navigationBar in
            navigationBar.barStyle = .black
            navigationBar.isHidden = true
        }
    }
}

fileprivate extension DesignSystem where UIComponent == UIView {
    
    static var mainViewStyle: DesignSystem {
        return .container { view in
            view.backgroundColor = .blue
        }
    }
}
