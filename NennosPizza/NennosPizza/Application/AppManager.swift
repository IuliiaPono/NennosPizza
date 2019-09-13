//
//  AppManager.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

final class AppManager {
    let imageDownloader: ImageDownloader
    
    let cartNotificationCenter: CartNotificationService
    let cartStorageService: CartStorageService
    
    let foodService: FoodBackendService
    let cartService: CartBackendService
    
    init() {
        let cartNotificationCenter = CartNotificationServiceDefault()
        let cartStorageService = CartStorageServiceDefault(cartNotificationService: cartNotificationCenter)
        
        let foodService = FoodBackendServiceDefault()
        let cartService = CartBackendServiceDefault()
        
        let imageDownloader = ImageDownloaderDefault()
        
        self.imageDownloader = imageDownloader
        
        self.cartNotificationCenter = cartNotificationCenter
        self.cartStorageService = cartStorageService
        
        self.foodService = foodService
        self.cartService = cartService
    }
}
