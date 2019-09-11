//
//  Pizza.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

struct Pizza: Purchasable, Codable, Equatable {
    let name: String
    let ingredients: [Ingredient]
    let imageUrl: String?
    let basePrice: Double
    
    var price: Double {
        return basePrice + ingredients.map { $0.price }.reduce(0, +)
    }
}
