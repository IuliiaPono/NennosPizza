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

// MARK: - Modal Presentation

extension Router {
    func present(_ destinationView: UIViewController, animated: Bool = true, completion: OnCloseBlock? = nil) {
        self.viewController?.present(destinationView, animated: animated, completion: completion)
    }
    
    func dismiss() {
        viewController?.view.endEditing(true)
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    func dismiss(animated: Bool, completion: OnCloseBlock? = nil) {
        viewController?.view.endEditing(true)
        viewController?.dismiss(animated: animated, completion: completion)
    }
}

// MARK: - Pop/Push presentation

extension Router {
    func push(_ destinationView: UIViewController) {
        viewController?.navigationController?.pushViewController(destinationView, animated: true)
    }
    
    func pop(to destinationView: UIViewController) {
        viewController?.navigationController?.popToViewController(destinationView, animated: true)
    }
    
    func pop() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
