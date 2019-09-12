//
//  Router+PurchaseBanner.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

import UIKit

extension Router {
    
    private static let purchaseBanner = PurchaseBanner()
    
    func presentBanner() {
        Router.purchaseBanner.show()
    }
}
