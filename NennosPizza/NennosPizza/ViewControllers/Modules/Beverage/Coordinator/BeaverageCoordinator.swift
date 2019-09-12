//
//  BeaverageCoordinator.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

class BeverageCoordinator: BaseCoordinator<BeverageViewController> {
    override class func createModule(with appManager: AppManager) -> BeverageViewController {
        let viewController: BeverageViewController = MainStoryboard.createBeverageViewController()
        
        let router = Router(viewController: viewController)
        
        let presenter = BeveragePresenterDefault(router: router, view: viewController)
        
        let interactor = BeverageInteractorDefault(presenter: presenter, appManager: appManager)
        
        viewController.interactor = interactor
        
        return viewController
    }
}
