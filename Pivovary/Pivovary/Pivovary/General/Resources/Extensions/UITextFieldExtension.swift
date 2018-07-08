//
//  UITextFieldExtension.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 08.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func addShakeAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5, y: self.center.y))
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    func setAttrPlaceholderWith(text: String, color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedStringKey.foregroundColor: color])
    }
}
