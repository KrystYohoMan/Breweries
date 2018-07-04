//
//  BreweriesViewController.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 02.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit
import SafariServices
import Alamofire

final class BreweriesViewController: UIViewController {

    private let breweriesView = BreweriesView()
    private let breweriesDataSource = BreweriesDataSource()
    
    override func loadView() {
        view = breweriesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

extension BreweriesViewController {
    
    func setupTableView() {
        breweriesView.tableView.dataSource = breweriesDataSource
        breweriesView.tableView.delegate = self
        breweriesView.tableView.register(BreweriesTableViewCell.self,
                                         forCellReuseIdentifier: String(describing: BreweriesTableViewCell.self)
        )
    }
}

extension BreweriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: "https://www.apple.com/cz/") else { return }
        let agreementsWebsiteControler = SFSafariViewController(url: url)
        present(agreementsWebsiteControler, animated: true, completion: nil)
    }
}
