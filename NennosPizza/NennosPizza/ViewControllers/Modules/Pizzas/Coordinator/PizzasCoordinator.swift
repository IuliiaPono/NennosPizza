//
//  PizzasCoordinator.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

class PizzaCoordinator: BaseCoordinator<PizzasViewController> {
    override class func createModule() -> PizzasViewController {
        let viewController: PizzasViewController = MainStoryboard.createPizzasViewController()
        
        let imageDownloader = ImageDownloaderDefault()
        
        let router = Router(viewController: viewController)
        
        let presenter = PizzasPresenterDefault(router: router, view: viewController, imageDownloader: imageDownloader)
        
        let foodService = FoodBackendServiceDefault()
        
        let interactor = PizzasInteractorDefault(presenter: presenter, foodBackendService: foodService)
        
        viewController.interactor = interactor
        
        return viewController
    }
}
