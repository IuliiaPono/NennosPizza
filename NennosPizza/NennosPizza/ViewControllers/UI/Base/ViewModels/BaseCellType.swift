//
//  BaseCellType.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

enum BaseCellType {
    case deletable
    case addable
    case selectable
    
    var cellRightImage: UIImage? {
        switch self {
        case .addable:
            return UIImage(named: "ic_create_pizza")
        case .deletable:
            return UIImage(named: "ic_remove")
        case.selectable:
            return UIImage(named: "ic_checked")
        }
    }
}
