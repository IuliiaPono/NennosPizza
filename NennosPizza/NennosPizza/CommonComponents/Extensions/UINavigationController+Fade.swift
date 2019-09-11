//
//  UINavigationController+Fade.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func fade(to viewControllers: [UIViewController]) {
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.type = .fade
        view.layer.add(transition, forKey: nil)
        setViewControllers(viewControllers, animated: false)
    }
}
