//
//  BreweriesDataSource.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 02.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit

final class BreweriesDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breweriesNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BreweriesTableViewCell.self), for: indexPath) as? BreweriesTableViewCell else {
            assertionFailure("Non existing cell")
            return UITableViewCell()
        }
        cell.textLabel?.text = "\(breweriesNameArray[indexPath.row])"
        return cell
    }
}
