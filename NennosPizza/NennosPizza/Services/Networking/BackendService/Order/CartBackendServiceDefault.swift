//
//  CartBackendServiceDefault.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation
import PromiseKit

final class CartBackendServiceDefault: OrderBackendService, CartBackendService {
    func orderFood(purchases: [Purchasable]) -> Promise<Void> {
        let (pizzas, drinkIDs) = split(purchases: purchases)
        return client.post(path: "post", parameters: ["pizzas": pizzas.container, "drinks": drinkIDs]).then { response -> Promise<Void> in return
            .value(())
        }
    }
    
    private func split(purchases: [Purchasable]) -> (pizzas: [BackendPizzaObject], drinkIDs: [Beverage.ID]) {
        var pizzas: [BackendPizzaObject] = []
        var drinkIDs: [Beverage.ID] = []
        
        purchases.forEach { product in
            if let pizza = product as? Pizza {
                pizzas.append(pizza.rawPizza)
            } else if let drink = product as? Beverage {
                drinkIDs.append(drink.id)
            }
        }
        
        return (pizzas, drinkIDs)
    }
}
