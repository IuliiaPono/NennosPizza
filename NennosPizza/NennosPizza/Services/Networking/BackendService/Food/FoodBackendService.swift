//
//  FoodBackendService.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation
import PromiseKit

protocol FoodBackendService {
    func getPizzas(ingredients: [Ingredient]) -> Promise<[Pizza]>
    func getIngredients() -> Promise<[Ingredient]>
    func getBeverage() -> Promise<[Beverage]>
}
