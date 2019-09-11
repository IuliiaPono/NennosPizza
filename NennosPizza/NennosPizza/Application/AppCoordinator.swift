//
//  AppCoordinator.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

final class AppCoordinator {
    private let window: UIWindow
    
    private let navigation: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        
        let navigation = UINavigationController()
        navigation.isNavigationBarHidden = true
        self.navigation = navigation
    }
    
    func start() {
        window.rootViewController = navigation
        let pizzaViewController = PizzaCoordinator.createModule()
        navigation.fade(to: [pizzaViewController])
    }
}
