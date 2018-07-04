//
//  BreweriesRequest.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 03.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import Foundation
import Alamofire

class BreweriesRequest {
    
    private let urlString = "https:www.reintodev.cz:4006/api/breweries?userId=1&skip=1"
    private let headers = ["Content-Type" : "application/json"]
    private let method: HTTPMethod = .get
    var nameArray = [String]()
    
    
    func apiRequest() {
        Alamofire.request(urlString, method: method, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
            if let value = response.result.value {
                if let json = value as? [String : Any], let name = json["name"] as? String {
                    self.nameArray.append(name)
                }
                print(value)
            }
        }
    }
    
    func breweriesNameArray(array: [String]) {
        nameArray = array
    }
}
