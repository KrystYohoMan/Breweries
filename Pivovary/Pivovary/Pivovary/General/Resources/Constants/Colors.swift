//
//  Colors.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 29.06.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit
import UIKit

enum Color {
    case white
    case black
    case beerYellow
    case gray
    
    var color: UIColor {
        switch self {
        case .white:
            return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        case .black:
            return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        case .beerYellow:
            return UIColor(red: 242/255, green: 203/255, blue: 108/255, alpha: 1)
        case .gray:
            return UIColor(red: 76/255, green: 76/255, blue: 76/255, alpha: 1)
        }
    }
}

struct ColorStruct {
    public static func whiteWith(alpha: CGFloat) -> UIColor {
        return UIColor.white.withAlphaComponent(alpha)
    }
    
    public static func colorWith(color: UIColor, alpha: CGFloat) -> UIColor {
        return color.withAlphaComponent(alpha)
    }
    
    public static func blackWith(alpha: CGFloat) -> UIColor {
        return UIColor.black.withAlphaComponent(alpha)
    }
}
