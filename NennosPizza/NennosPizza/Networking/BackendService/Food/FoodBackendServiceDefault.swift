//
//  FoodBackendServiceDefault.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation
import PromiseKit

final class FoodBackendServiceDefault: ProductsBackendService, FoodBackendService {
    func getPizzas(ingredients: [Ingredient]) -> Promise<[Pizza]> {
        return client.get(path: BackendRequestPath.getPizzas.rawValue).then { response -> Promise<[Pizza]> in
            let breafPizzas = try self.clientDecoder.decode(BackendPizzasObject.self, from: response)
            return .value(breafPizzas.getPizzas(ingredients: ingredients))
        }
    }
    
    func getIngredients() -> Promise<[Ingredient]> {
        return client.get(path: BackendRequestPath.getIngredients.rawValue).then { response -> Promise<[Ingredient]> in
            return .value(try self.clientDecoder.decode([Ingredient].self, from: response))
        }
    }
    
    func getDrinks() -> Promise<[Drink]> {
        return client.get(path: BackendRequestPath.getDrinks.rawValue).then { response -> Promise<[Drink]> in
            return .value(try self.clientDecoder.decode([Drink].self, from: response))
        }
    }
}
