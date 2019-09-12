//
//  CartStorageService.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

protocol CartStorageService {
    func addPurchase(_ object: Purchasable)
    func removePurchase(_ object: Purchasable)
    func getPurchases() -> [Purchasable]
    func removePurchases()
}

class CartStorageServiceDefault: StorageServiceDefault, CartStorageService {
    
    private let purchasesKey = "cart_purchases_key"
    
    private let cartNotificationService: CartNotificationService
    
    init(cartNotificationService: CartNotificationService) {
        self.cartNotificationService = cartNotificationService
        super.init()
    }
    
    func addPurchase(_ purchase: Purchasable) {
        var purchases = getPurchases()
        purchases.append(purchase)
        storage.save(object: purchases, for: purchasesKey)
        cartNotificationService.postCartUpdateNotification()
    }
    
    func removePurchase(_ object: Purchasable) {
        var purchases = getPurchases()
        purchases.removeAll(where: { object.name == $0.name })
        storage.save(object: purchases, for: purchasesKey)
        cartNotificationService.postCartUpdateNotification()
    }
    
    func getPurchases() -> [Purchasable] {
        return storage.getObject(for: purchasesKey) as? [Purchasable] ?? []
    }
    
    func removePurchases() {
        storage.removeObject(for: purchasesKey)
        cartNotificationService.postCartUpdateNotification()
    }
}

