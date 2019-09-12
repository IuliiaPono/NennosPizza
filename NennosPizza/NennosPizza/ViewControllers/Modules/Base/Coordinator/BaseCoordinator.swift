//
//  BaseCoordinator.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class BaseCoordinator<VС: BaseViewController> {
    
    class func createModule(with appManager: AppManager) -> VС {
        return VС()
    }
}
