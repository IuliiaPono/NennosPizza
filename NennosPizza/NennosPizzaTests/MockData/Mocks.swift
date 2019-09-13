//
//  Mocks.swift
//  NennosPizzaTests
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

@testable import NennosPizza

extension Array where Element == Ingredient {
    static let `default` = [
        Ingredient(id: 1, name: "Basil", price: 0.5),
        Ingredient(id: 2, name: "Mozarella", price: 1.0),
        Ingredient(id: 3, name: "Tomato", price: 1.0)
    ]
}
