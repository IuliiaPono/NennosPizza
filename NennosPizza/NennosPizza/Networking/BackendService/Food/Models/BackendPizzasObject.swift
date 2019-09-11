//
//  BackendPizzasObject.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

struct BackendPizzasObject: Codable, Equatable {
    let pizzas: [BackendPizzaObject]
    let basePrice: Double
}

extension BackendPizzasObject {
    func getPizzas(ingredients: [Ingredient]) -> [Pizza] {
        return pizzas.map { backendPizzaObject in
            return Pizza(name: backendPizzaObject.name,
                         ingredients: ingredients.filter { backendPizzaObject.ingredients.contains($0.id) },
                         imageUrl: backendPizzaObject.imageUrl,
                         basePrice: basePrice)
        }
    }
}
