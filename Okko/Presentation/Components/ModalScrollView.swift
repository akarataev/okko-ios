//
//  ModalScrollView.swift
//  Okko
//
//  Created by Alexey Karataev on 21/07/2019.
//  Copyright © 2019 Alexey Karataev. All rights reserved.
//

import UIKit

protocol ModalScrollViewTransitionDelegate: class {
    func updatePresentationState(_ sender: UIScrollView)
}

final class ModalScrollView: UIScrollView, UIScrollViewDelegate {
    
    private let elementOffset: CGFloat = 24
    private let elementHeight: CGFloat = 250
    private let yDissmisalPosition: CGFloat = 20
    
    weak var transitionDelegate: ModalScrollViewTransitionDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yContentOffset = scrollView.contentOffset.y
        if yContentOffset <= 0 && scrollView.isTracking {
            if yDissmisalPosition + yContentOffset <= 0 {
                transitionDelegate?.updatePresentationState(scrollView)
                setContentOffset(.zero, animated: true)
            }
        }
    }
    
    func fillScrollView(with elements: Int) {
        setContentSize(for: elements)
        for elementIndex in 1...elements {
            let view = UIView()
            view.backgroundColor = .random
            view.frame = frame(for: elementIndex)
            addSubview(view)
        }
    }

    private func setContentSize(for elements: Int) {
        let elements = CGFloat(elements)
        let viewSpringOffset: CGFloat = 40
        let offsetHeight = elementOffset + elementHeight
        let height =  viewSpringOffset + elementOffset + offsetHeight * elements
        let size = CGSize(width: frame.width, height: height)
        contentSize = size
    }
    
    private func frame(for elementIndex: Int) -> CGRect {
        guard let superviewFrame = superview?.frame else { return .zero }
        let elementIndex = CGFloat(elementIndex)
        let yOrigin = (elementIndex == 1) ? elementOffset:
            elementHeight * (elementIndex - 1) + elementOffset * elementIndex
        let origin = CGPoint(x: elementOffset, y: yOrigin)
        let width = superviewFrame.width - (elementOffset * 2)
        let size = CGSize(width: width, height: elementHeight)
        return CGRect(origin: origin, size: size)
    }
}
