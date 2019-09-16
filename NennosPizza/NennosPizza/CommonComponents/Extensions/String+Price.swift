//
//  String+Price.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

extension Double {
    func priceString() -> String {
        return "$\(self)"
    }
}
