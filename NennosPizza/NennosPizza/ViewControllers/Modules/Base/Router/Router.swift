//
//  Router.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit
import PromiseKit

class Router {
    private(set) weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

// MARK: - Pop/Push presentation

extension Router {
    func push(_ module: Controller, with context: ApplicationContext) {
        let destinationView = module.viewController(with: context)
        viewController?.navigationController?.pushViewController(destinationView, animated: true)
    }
    
    func popToRoot() {
        viewController?.navigationController?.popToRootViewController(animated: true)
    }
    
    func pop() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
