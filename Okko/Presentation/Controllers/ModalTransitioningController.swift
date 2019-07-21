//
//  ModalTransitioningController.swift
//  Okko
//
//  Created by Alexey Karataev on 20/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

final class ModalTransitioningController: NSObject, UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return ModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
