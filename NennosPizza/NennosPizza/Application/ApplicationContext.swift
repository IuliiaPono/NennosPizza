//
//  ApplicationContext.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

final class ApplicationContext {
    let imageDownloader: ImageDownloader
    
    let cartNotificationCenter: CartNotificationService
    let cartStorageService: CartStorageService
    
    let foodService: FoodBackendService
    let cartService: CartBackendService
    
    init() {
        let cartNotificationCenter = DefaultCartNotificationService()
        let cartStorageService = DefaultCartStorageService(cartNotificationService: cartNotificationCenter)
        
        let foodService = DefaultFoodBackendService()
        let cartService = DefaultCartBackendService()
        
        let imageDownloader = DefaultImageDownloader()
        
        self.imageDownloader = imageDownloader
        
        self.cartNotificationCenter = cartNotificationCenter
        self.cartStorageService = cartStorageService
        
        self.foodService = foodService
        self.cartService = cartService
    }
}
