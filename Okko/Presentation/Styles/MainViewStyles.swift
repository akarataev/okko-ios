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
        applyMainHeaderStyle()
        applyMainImageViewStyle()
    }
    
    private func applyMainHeaderStyle() {
        subheader.apply(.subheaderLabelTextStyles, .subheaderLabelLayout(at: view))
        header.apply(.headerLabelTextStyles, .headerLabelLayout(at: view, under: subheader))
    }
    
    private func applyMainImageViewStyle() {
        imageView.apply(.mainImageViewStyle(at: view))
    }
    
    private func applyNavigationBarStyle() {
        navigationController?.navigationBar.apply(.mainNavigationBarStyle)
    }
    
    private func applyMainViewStyle() {
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
            view.backgroundColor = UIColor(rgb: 0x252A2B)
        }
    }
}


fileprivate extension DesignSystem where UIComponent == UIImageView {
    
    static func mainImageViewStyle(at target: UIView) -> DesignSystem {
        return .container { imageView in
            imageView.image = UIImage(named: "cinema")
            imageView.contentMode = .scaleAspectFit
            imageView.frame = target.frame
        }
    }
}


fileprivate extension DesignSystem where UIComponent == UILabel {
    
    static var subheaderLabelTextStyles: DesignSystem {
        return .container { label in
            label.text = "Press to screen"
            label.textColor = .white
            label.font = .systemFont(ofSize: 16, weight: .medium)
        }
    }
    
    static var headerLabelTextStyles: DesignSystem {
        return .container { label in
            label.text = "Choose lovely \ncinema"
            label.textColor = .white
            label.numberOfLines = 2
            label.font = .systemFont(ofSize: 28, weight: .heavy)
        }
    }
    
    static func subheaderLabelLayout(at target: UIView) -> DesignSystem {
        return .container { label in
            let topPadding = AppWindow.safeAreaInsets?.top ?? 0
            let offset = 40 + topPadding
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: target.topAnchor, constant: offset),
                label.leftAnchor.constraint(equalTo: target.leftAnchor, constant: 32)
            ])
        }
    }
    
    static func headerLabelLayout(at target: UIView, under: UILabel) -> DesignSystem {
        return .container { label in
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: under.bottomAnchor, constant: 8),
                label.leftAnchor.constraint(equalTo: target.leftAnchor, constant: 32)
            ])
        }
    }
}
