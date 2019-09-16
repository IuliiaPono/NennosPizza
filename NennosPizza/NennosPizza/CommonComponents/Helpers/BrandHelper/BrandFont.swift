//
//  BrandFont.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 09/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

enum BrandFont {
    case titleSemibold
    case subtitleRegular
    case textRegular
    case textSemibold
}

extension BrandFont {
    var asUIFont: UIFont {
        switch self {
        case .titleSemibold:
            return UIFont.systemFont(ofSize: 24, weight: .semibold)
        case .subtitleRegular:
            return UIFont.systemFont(ofSize: 16, weight: .regular)
        case .textRegular:
            return UIFont.systemFont(ofSize: 20, weight: .regular)
        case .textSemibold:
            return UIFont.systemFont(ofSize: 20, weight: .semibold)
        }
    }
}
