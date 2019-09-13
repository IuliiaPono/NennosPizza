//
//  CartBackendService.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation
import PromiseKit

protocol CartBackendService {
    func orderFood(purchases: [Purchasable]) -> Promise<Void>
}
