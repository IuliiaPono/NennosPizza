//
//  BackendError.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

struct BackendError: Error, Codable {
    let сode: Int
    let description: String
}
