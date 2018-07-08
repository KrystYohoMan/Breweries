//
//  BreweriesRequest.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 03.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import NotificationCenter

let reloadDataNotification: NSNotification.Name = NSNotification.Name(rawValue: "reloadDataNotification")

private let urlString = "https:www.reintodev.cz:4006/api/breweries?userId=1&skip=1"
private let headers = ["Content-Type" : "application/json"]
private let method: HTTPMethod = .get
var breweriesNameArray = [String]()
var breweriesURLArray = [String]()
    
func getBrewerData() {
    apiRequest().done { object -> Void in
        for value in object {
            breweriesNameArray.append(value.name)
            breweriesURLArray.append(value.url)
        }
        DispatchQueue.main.async {
            NotificationCenter.default.post(NSNotification(name: reloadDataNotification, object: nil) as Notification)
        }
    }.catch { error in
        print(error)
    }
}
    
func apiRequest() -> Promise<[BrewerModel]> {
    let request = Alamofire.request(urlString, method: method, encoding: JSONEncoding.default, headers: headers)
    return request.responseDecodable()
}

extension Alamofire.DataRequest {
    func responseDecodable<T: Decodable>(queue: DispatchQueue = DispatchQueue.main) -> Promise<T> {
        return Promise { seal in
            responseData(queue: queue) { response in
                switch response.result {
                case .success(let value):
                    let decoder = JSONDecoder()
                    do {
                        let data = try decoder.decode(T.self, from: value)
                        seal.fulfill(data)
                    } catch let e {
                        seal.reject(e)
                    }
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
}

