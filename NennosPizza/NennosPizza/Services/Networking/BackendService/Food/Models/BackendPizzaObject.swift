//
//  BackendPizzaObject.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

struct BackendPizzaObject: Codable, Equatable {
    let name: String
    let ingredients: [Int64]
    let imageUrl: String?
}
