//
//  ModalViewStyles.swift
//  Okko
//
//  Created by Alexey Karataev on 20/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

extension ModalViewController {
    
    func applyModalViewControllerStyles() {
        applyModalViewStyles()
        applyBasicScrollViewLayout()
    }
    
    func applyModalViewStyles() {
        view.apply(.modalViewStyles)
    }
    
    func applyBasicScrollViewLayout() {
        scrollView.isScrollEnabled = false
        scrollView.apply(.basicScrollViewLayout(at: view))
    }
}


extension ModalPresentationController {
    
    func applyHalfScreenState() {
        let presentedController = presentedViewController as? ModalViewController
        presentedController?.scrollView.isScrollEnabled = false
        applyHalfScreenLayout()
    }
    
    private func applyHalfScreenLayout() {
        guard let containerViewFrame = containerView?.frame else { return }
        presentedView?.apply(.halfScreenLayout(
            containerViewFrame: containerViewFrame, safeAreaInsets: safeAreaInsets))
    }
    
    func applyThreeQuartersScreenState() {
        let presentedController = presentedViewController as? ModalViewController
        presentedController?.scrollView.isScrollEnabled = true
        applyThreeQuartersScreenLayout()
    }
    
    private func applyThreeQuartersScreenLayout() {
        guard let containerViewFrame = containerView?.frame else { return }
        presentedView?.apply(.threeQuartersScreenLayout(
            containerViewFrame: containerViewFrame, safeAreaInsets: safeAreaInsets))
    }
    
    func applyDimmingViewInitialStyle() {
        guard let containerViewFrame = containerView?.frame else { return }
        dimmingView.apply(.dimmingViewInitialStyle(containerViewFrame: containerViewFrame))
    }
    
    func applyPresentationTransitionStyle() {
        dimmingView.alpha = 1
        presentingViewController.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
    }
    
    func applyDismissalTransitionStyle() {
        dimmingView.alpha = 0
        presentingViewController.view.transform = CGAffineTransform.identity
    }
}


fileprivate extension DesignSystem where UIComponent == UIView {
    
    static var springWithDampingOffset: CGFloat {
        return 40.0
    }
    
    static func dimmingViewInitialStyle(containerViewFrame: CGRect) -> DesignSystem {
        return .container { view in
            view.frame = CGRect(origin: .zero, size: containerViewFrame.size)
            view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = view.bounds
        }
    }
    
    static func halfScreenLayout(containerViewFrame: CGRect, safeAreaInsets: UIEdgeInsets) -> DesignSystem {
        return .container { view in
            let springOffset = springWithDampingOffset
            let divider = PresentationState.halfScreen.rawValue
            let yOrigin = (containerViewFrame.height + safeAreaInsets.bottom) / divider
            let height = yOrigin + springOffset
            let origin = CGPoint(x: 0, y: yOrigin)
            let size = CGSize(width: containerViewFrame.width, height: height)
            view.frame = CGRect(origin: origin, size: size)
            view.layoutIfNeeded()
        }
    }
    
    static func threeQuartersScreenLayout(containerViewFrame: CGRect, safeAreaInsets: UIEdgeInsets) -> DesignSystem {
        return .container { view in
            let springOffset = springWithDampingOffset
            let divider = PresentationState.threeQuarters.rawValue
            let yOrigin = (containerViewFrame.height + safeAreaInsets.bottom) / divider
            let height = (containerViewFrame.height + safeAreaInsets.bottom + springOffset) - yOrigin
            let origin = CGPoint(x: 0, y: yOrigin)
            let size = CGSize(width: containerViewFrame.width, height: height)
            view.frame = CGRect(origin: origin, size: size)
            view.layoutIfNeeded()
        }
    }
    
    static var modalViewStyles: DesignSystem {
        return .container { view in
            view.backgroundColor = .yellow
            view.clipsToBounds = true
        }
    }
    
}


fileprivate extension DesignSystem where UIComponent == ModalScrollView {
    
    static func basicScrollViewLayout(at target: UIView) -> DesignSystem {
        return .container { scrollView in
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: target.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: target.bottomAnchor),
                scrollView.leftAnchor.constraint(equalTo: target.leftAnchor),
                scrollView.rightAnchor.constraint(equalTo: target.rightAnchor)
            ])
        }
    }
}
