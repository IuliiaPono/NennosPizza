//
//  MainStoryboard.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

// TO-DO: Make separate storyboards in case the project will grow. For now it's okay to keep everything in a single one

enum MainStoryboard {
    static let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    static func createPizzasViewController() -> PizzasViewController {
        return storyboard.instantiateViewController(withIdentifier: "pizzasVC") as! PizzasViewController
    }
    
    static func createCartViewController() -> CartViewController {
        return storyboard.instantiateViewController(withIdentifier: "cartVC") as! CartViewController
    }
    
    static func createBeverageViewController() -> BeverageViewController {
        return storyboard.instantiateViewController(withIdentifier: "beverageVC") as! BeverageViewController
    }
    
    static func createGratitudeViewController() -> GratitudeViewController {
        return storyboard.instantiateViewController(withIdentifier: "gratitudeVC") as! GratitudeViewController
    }
}
