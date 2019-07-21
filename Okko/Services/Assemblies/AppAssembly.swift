//
//  AppAssembly.swift
//  Okko
//
//  Created by Alexey Karataev on 20/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

class AppAssembly {
    
    func setupMain(_ window: inout UIWindow?) {
        let mainVC = MainViewController()
        let rootNC = UINavigationController(rootViewController: mainVC)
        rootNC.navigationBar.isHidden = true
        window = AppWindow()
        window?.rootViewController = rootNC
        window?.makeKeyAndVisible()
    }
}
