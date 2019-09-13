//
//  BackendPizzaObject.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

struct BackendPizzaObject: Codable, JSONSerializaber, Equatable {
    let name: String
    let ingredients: [Int]
    let imageUrl: String?
    
    var container: Any {
        return [
            "name": name,
            "ingredients": ingredients,
            "imageURL": imageUrl
        ]
    }
}
