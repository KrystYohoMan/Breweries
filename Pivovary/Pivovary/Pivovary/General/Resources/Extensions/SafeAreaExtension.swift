//
//  SafeAreaExtension.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 04.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit

public enum LayoutEdge {
    case top
    case right
    case bottom
    case left
}
extension UIView {
    
    public func autoPinToSafeArea(toEdge edge: LayoutEdge, withOffset offset: CGFloat = 0.0) {
        switch edge {
        case .top:
            guard let topAnchorOfSuperview = superview?.safeAreaTopAnchor else { return }
            topAnchor.constraint(equalTo: topAnchorOfSuperview, constant: offset).isActive = true
        case .right:
            guard let rightAnchorOfSuperview = superview?.safeAreaRightAnchor else { return }
            rightAnchor.constraint(equalTo: rightAnchorOfSuperview, constant: offset).isActive = true
        case .bottom:
            guard let bottomAnchorOfSuperview = superview?.safeAreaBottomAnchor else { return }
            bottomAnchor.constraint(equalTo: bottomAnchorOfSuperview, constant: offset).isActive = true
        case .left:
            guard let leftAnchorOfSuperview = superview?.safeAreaLeftAnchor else { return }
            leftAnchor.constraint(equalTo: leftAnchorOfSuperview, constant: offset).isActive = true
        }
    }
}

fileprivate extension UIView {
    
    // Top Anchor
    fileprivate var safeAreaTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    // Bottom Anchor
    fileprivate var safeAreaBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
    
    // Left Anchor
    fileprivate var safeAreaLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.leftAnchor
        } else {
            return self.leftAnchor
        }
    }
    
    // Right Anchor
    fileprivate var safeAreaRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.rightAnchor
        } else {
            return self.rightAnchor
        }
    }
}
