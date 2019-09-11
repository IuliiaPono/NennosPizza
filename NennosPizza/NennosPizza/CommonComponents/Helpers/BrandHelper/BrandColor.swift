//
//  BrandColor.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 09/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

enum BrandColor {
    case yellow
    case red
    case gray
    case lightGray
    case black
    case white
}

extension BrandColor {
    
    func asUIColor() -> UIColor {
        switch self {
        case .yellow:
            return UIColor(rgb: 0xFECD2C)
        case .red:
            return UIColor(rgb: 0xE5615A)
        case .gray:
            return UIColor(rgb: 0x4A4A4A)
        case .lightGray:
            return UIColor(rgb: 0x636363)
        case .black:
            return UIColor(rgb: 0x000000)
        case .white:
            return UIColor(rgb: 0xFFFFFF)
        }
    }
}
