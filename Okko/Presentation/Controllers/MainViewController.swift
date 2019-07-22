//
//  MainViewController.swift
//  Okko
//
//  Created by Alexey Karataev on 20/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let gestureRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gestureRecognizer.addTarget(self, action: #selector(presentModalController(_:)))
        view.addGestureRecognizer(gestureRecognizer)
        applyMainViewControllerStyles()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func presentModalController(_ sender: UITapGestureRecognizer) {
        let assembly = ModalAssembly()
        assembly.presentModalController(by: self)
    }
}
