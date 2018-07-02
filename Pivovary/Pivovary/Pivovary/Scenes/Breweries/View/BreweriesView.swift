//
//  BreweriesView.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 02.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit

class BreweriesView: UIView {

    let tableView = UITableView()

    init() {
        super.init(frame: .zero)
        addSubviews()
        setUpViews()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BreweriesView: ViewLayout {
    
    func addSubviews() {
        addSubview(tableView)
    }
    
    func setUpViews() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.separatorStyle = .none
    }
    
    func layoutViews() {
        tableView.autoPinEdgesToSuperviewEdges()
    }
}
