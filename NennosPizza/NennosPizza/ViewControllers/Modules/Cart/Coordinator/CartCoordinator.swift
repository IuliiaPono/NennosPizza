//
//  CartCoordinator.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class CartCoordinator: BaseCoordinator<CartViewController> {
    override class func createModule(with applicationContext: ApplicationContext) -> CartViewController {
        let viewController = MainStoryboard.createCartViewController()
        
        let router = Router(viewController: viewController)
        
        let presenter = DefaultCartPresenter(router: router, view: viewController)
        
        let interactor = DefaultCartInteractor(presenter: presenter, applicationContext: applicationContext)
        
        viewController.interactor = interactor
        
        return viewController
    }
}
