//
//  ModalAssembly.swift
//  Okko
//
//  Created by Alexey Karataev on 22/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

class ModalAssembly {
    
    func presentModalController(by presenter: UIViewController) {
        let modalVC = ModalViewController()
        let modalTC = ModalTransitioningController()
        modalVC.transitioningDelegate = modalTC
        modalVC.modalPresentationStyle = .custom
        presenter.present(modalVC, animated: true)
    }
}
