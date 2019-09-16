//
//  PizzasCoordinator.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

class PizzaCoordinator: BaseCoordinator<PizzasViewController>  {
    override class func createModule(with applicationContext: ApplicationContext) -> PizzasViewController {
        let viewController: PizzasViewController = MainStoryboard.createPizzasViewController()
        
        let router = Router(viewController: viewController)
        
        let presenter = DefaultPizzasPresenter(router: router, view: viewController)
        
        let interactor = DefaultPizzasInteractor(presenter: presenter, applicationContext: applicationContext)
        
        viewController.interactor = interactor
        
        return viewController
    }
}
