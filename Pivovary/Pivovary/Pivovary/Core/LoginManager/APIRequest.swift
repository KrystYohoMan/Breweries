//
//  APIRequest.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 02.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import UIKit
import Alamofire

final class APIRequest: NSObject {
    
    private let urlString = "https://www.reintodev.cz:4006/api/login"
    private let headers    = ["Content-Type" : "application/json"]
    private let parametres: Parameters = ["login" : "test@test.cz",
                                          "password" : "test"]
    
    func apiRequest() {
        Alamofire.request(urlString, method: .post, parameters: parametres, encoding: JSONEncoding.default, headers : headers)
            .responseJSON { response in
                print(response)
        }
    }
}
