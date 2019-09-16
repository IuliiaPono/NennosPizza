//
//  Beverage.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

struct Beverage: Purchasable, Codable, Equatable {
    typealias ID = Int
    
    let id: ID
    let name: String
    let price: Double
}
