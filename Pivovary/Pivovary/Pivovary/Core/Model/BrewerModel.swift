//
//  BrewerModel.swift
//  Pivovary
//
//  Created by Tadeusz Raszka on 03.07.18.
//  Copyright © 2018 Krystian Labaj. All rights reserved.
//

import Foundation
import Unbox

struct BrewerModel {
    let id: Int
    let name: String
    let url: String
}

extension BrewerModel: Unboxable {
    init(unboxer: Unboxer) throws {
        id = try unboxer.unbox(key: "id")
        name = try unboxer.unbox(key: "name")
        url = try unboxer.unbox(key: "url")
    }
}
