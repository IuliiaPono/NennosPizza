//
//  Router+ControllersEnum.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 16/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

extension Router {
    enum Controller {
        case pizza
        case beverage
        case cart
        case gratitude
        
        func viewController(with applicationContext: ApplicationContext) -> UIViewController {
            switch self {
            case .pizza:
                return PizzaCoordinator.createModule(with: applicationContext)
            case .beverage:
                return BeverageCoordinator.createModule(with: applicationContext)
            case .cart:
                return CartCoordinator.createModule(with: applicationContext)
            case .gratitude:
                return GratitudeCoordinator.createModule(with: applicationContext)
            }
        }
    }
}
