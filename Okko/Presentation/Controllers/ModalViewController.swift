//
//  ModalViewController.swift
//  Okko
//
//  Created by Alexey Karataev on 20/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    var scrollView = ModalScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.transitionDelegate = self
        view.addSubview(scrollView)
        scrollView.fillScrollView(with: 10)
        applyModalViewControllerStyles()
    }
}


extension ModalViewController: ModalScrollViewTransitionDelegate {
    
    func updatePresentationState(_ sender: UIScrollView) {
        let modalPresentation = presentationController as? ModalPresentationController
        modalPresentation?.automaticUpdatePresentationState()
    }
}


extension ModalViewController: ModalScrollViewPresentationDelegate {
    
    func manualScrollViewUpdate(with yScrollOffset: CGFloat) {
        let offset = CGPoint(x: 0, y: -yScrollOffset)
        scrollView.setContentOffset(offset, animated: false)
    }
}
