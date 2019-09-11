//
//  Drink.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

struct Drink: Purchasable, Codable, Equatable {
    let id: Int64
    let name: String
    let price: Double
}
