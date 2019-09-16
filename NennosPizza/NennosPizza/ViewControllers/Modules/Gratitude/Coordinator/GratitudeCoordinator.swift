//
//  GratitudeCoordinator.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class GratitudeCoordinator: BaseCoordinator<GratitudeViewController> {
    override class func createModule(with applicationContext: ApplicationContext) -> GratitudeViewController {
        let viewController = MainStoryboard.createGratitudeViewController()
        
        let router = Router(viewController: viewController)
        
        let presenter = DefaultGratitudePresenter(router: router, view: viewController)
        
        let interactor = DefaultGratitudeInteractor(presenter: presenter)
        
        viewController.interactor = interactor
        
        return viewController
    }
}
