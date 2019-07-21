//
//  MainViewController.swift
//  Okko
//
//  Created by Alexey Karataev on 20/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let listVC = ModalViewController()
        let listTC = ModalTransitioningController()
        listVC.transitioningDelegate = listTC
        listVC.modalPresentationStyle = .custom
        
        present(listVC, animated: true)
        
    }
}
