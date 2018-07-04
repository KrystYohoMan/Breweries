//
//  SeparatorView.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 30.06.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit

final class SeparatorView: UIView {
    
    var separatorHeight: CGFloat
    var separatorColor: UIColor
    
    init(height: CGFloat = 1, color: UIColor = Color.beerYellow.color) {
        separatorHeight = height
        separatorColor = color
        
        super.init(frame: .zero)
        
        setUpViews()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SeparatorView: ViewLayout {
    func addSubviews() {
        // Mark: Nothing to set
    }
    
    func setUpViews() {
        backgroundColor = separatorColor
    }
    
    func layoutViews() {
        autoSetDimension(.height, toSize: separatorHeight)
    }
}
