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

class BreweriesViewController: UIViewController {

    private let breweriesView = BreweriesView()
    private let breweriesDataSource = BreweriesDataSource()
    
    override func loadView() {
        view = breweriesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        breweriesView.tableView.register(BreweriesTableViewCell.self,
                                         forCellReuseIdentifier: String(describing: BreweriesTableViewCell.self)
        )
        breweriesView.tableView.dataSource = breweriesDataSource
        breweriesView.tableView.delegate = self
    }
    
    func apiTest() {
        Alamofire.request("https://www.reintodev.cz:4006/api/breweries?userId=1&skip=skip").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
            }
        }
    }
}

extension BreweriesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        apiTest()
        //        let agreementsWebsiteControler = SFSafariViewController(url: URL(string: "https://www.apple.com/cz/")!)
        //        present(agreementsWebsiteControler, animated: true, completion: nil)
    }
}
