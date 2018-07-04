//
//  BreweriesTableViewCell.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 02.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit

final class BreweriesTableViewCell: UITableViewCell {
    
    private let brewerLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setUpViews()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BreweriesTableViewCell: ViewLayout {
    
    func addSubviews() {
        addSubview(brewerLabel)
    }
    
    func setUpViews() {
        brewerLabel.textAlignment = .center
    }
    
    func layoutViews() {
        brewerLabel.autoPinEdgesToSuperviewEdges()
    }
}

extension BreweriesTableViewCell {
    
    func setupWith(viewModel: BrewerModel) {
        brewerLabel.text = viewModel.name
    }
}
