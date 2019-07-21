//
//  ModalPresentationController.swift
//  Okko
//
//  Created by Alexey Karataev on 20/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

class ModalPresentationController: UIPresentationController {
    
    private var state: PresentationState = .halfScreen
    private let gestureRecognizer = UIPanGestureRecognizer()
    
    var dimmingView = UIView()
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        gestureRecognizer.addTarget(self, action: #selector(interactiveDraggingHandler))
        presentedViewController.view.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func interactiveDraggingHandler(_ sender: UIPanGestureRecognizer) {
        guard let presentedView = presentedView,
            let containerView = containerView else { return }
        
        let hDivider = PresentationState.halfScreen.rawValue
        let hOffset = containerView.frame.height / hDivider
        let tDivider = PresentationState.threeQuarters.rawValue
        let tOffset = containerView.frame.height / tDivider
        
        switch sender.state {
        case .began:
            presentedView.frame.size.height = containerView.frame.height
        case .changed:
            switch state {
            case .halfScreen:
                let yOrigin = sender.touchPoint.y + hOffset
                guard yOrigin > tOffset else { return }
                presentedView.frame.origin.y = yOrigin
            case .threeQuarters:
                let yOrigin = sender.touchPoint.y + tOffset
                guard yOrigin > tOffset else { return }
                presentedView.frame.origin.y = yOrigin
            }
        case .ended:
            setupNewPresentationState(with: sender.direction)
        default:
            break
        }
    }
    
    private func setupNewPresentationState(with direction: VerticalScrollDirection) {
        switch direction {
        case .up: setupNewPresentationState(.threeQuarters)
        case .down:
            switch state {
            case .halfScreen: presentedViewController.dismiss(animated: true)
            case .threeQuarters: setupNewPresentationState(.halfScreen) }
        }
    }
    
    private func setupNewPresentationState(_ state: PresentationState) {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: { [weak self] in
            switch state {
            case .halfScreen: self?.applyHalfScreenLayout()
            case .threeQuarters: self?.applyThreeQuartersScreenLayout() }
        }, completion: { [weak self] _ in self?.state = state })
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let presentedView = presentedView else { return .zero }
        applyHalfScreenLayout()
        return presentedView.frame
    }
    
    override func presentationTransitionWillBegin() {
        guard let containerView = self.containerView,
            let coordinator = presentingViewController.transitionCoordinator else { return }

        applyDimmingViewInitialStyle()
        containerView.addSubview(dimmingView)
        containerView.addSubview(presentedViewController.view)
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.applyPresentationTransitionStyle()
        })
    }

    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentingViewController.transitionCoordinator else { return }
        coordinator.animate(alongsideTransition: { [weak self] _ in
            self?.applyDismissalTransitionStyle()
        }, completion:  { [weak self] _ in
            self?.dimmingView.removeFromSuperview()
        })
    }
}
