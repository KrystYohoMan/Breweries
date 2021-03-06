//
//  BreweriesViewController.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 02.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit
import Alamofire

final class BreweriesViewController: UIViewController {
    
    private let breweriesDataSource = BreweriesDataSource()
    private let breweriesView = BreweriesView()
    
    override func loadView() {
        view = breweriesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView),
                                               name: reloadDataNotification, object: nil)
        getBrewerData()
    }
}

extension BreweriesViewController {
    
    func setupTableView() {
        breweriesView.tableView.dataSource = self.breweriesDataSource
        breweriesView.tableView.delegate = self
        breweriesView.tableView.register(BreweriesTableViewCell.self,
                                         forCellReuseIdentifier: String(describing: BreweriesTableViewCell.self)
        )
    }

    @objc func reloadTableView() {
        breweriesView.tableView.reloadData()
    }
}
