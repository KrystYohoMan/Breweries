//
//  LoginRequest.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 04.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import Foundation
import Alamofire

class LoginRequest {
    
    private let urlString = "https://www.reintodev.cz:4006/api/login"
    private let headers = ["Content-Type" : "application/json"]
    private let method: HTTPMethod = .post
    private let parameters: Parameters = ["login" : "test@test.cz",
                                          "password" : "test"]
    
    func apiRequest() {
        Alamofire.request(urlString, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            if let value = response.result.value {
                print(value)
            }
        }
    }
}
