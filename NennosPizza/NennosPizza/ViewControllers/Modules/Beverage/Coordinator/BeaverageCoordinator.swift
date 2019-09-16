//
//  BeaverageCoordinator.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

class BeverageCoordinator: BaseCoordinator<BeverageViewController> {
    override class func createModule(with applicationContext: ApplicationContext) -> BeverageViewController {
        let viewController: BeverageViewController = MainStoryboard.createBeverageViewController()
        
        let router = Router(viewController: viewController)
        
        let presenter = DefaultBeveragePresenter(router: router, view: viewController)
        
        let interactor = DefaultBeverageInteractor(presenter: presenter, applicationContext: applicationContext)
        
        viewController.interactor = interactor
        
        return viewController
    }
}
