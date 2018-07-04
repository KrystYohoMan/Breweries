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
    
    
    func apiRequest() {
        Alamofire.request(urlString, method: method, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if let value = response.result.value {
                print(value)
            }
        }
    }
}
