//
//  ApplicationCoordinator.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

final class ApplicationCoordinator {
    private let window: UIWindow
    
    private let navigationController: UINavigationController
    
    private let applicationContext: ApplicationContext
    
    init(window: UIWindow, applicationContext: ApplicationContext) {
        self.window = window
        self.applicationContext = applicationContext
        
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        self.navigationController = navigationController
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        let pizzaViewController = PizzaCoordinator.createModule(with: applicationContext)
        navigationController.fade(to: [pizzaViewController])
    }
}
