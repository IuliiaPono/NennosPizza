//
//  MainStoryboard.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

enum MainStoryboard {
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func createPizzasViewController() -> PizzasViewController {
        return storyboard.instantiateViewController(withIdentifier: "pizzasVC") as! PizzasViewController
    }
    
    static func createCartViewController() -> CartViewController {
        return storyboard.instantiateViewController(withIdentifier: "cartVC") as! CartViewController
    }
}
