//
//  CartNotificationService.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

protocol CartNotificationService {
    func postCartUpdateNotification()
    func addObserverCartUpdateNotification(completion: @escaping OnCloseBlock) -> NotificationContext
}

class DefaultCartNotificationService: NotificationsService, CartNotificationService {
    
    private let cartUpdateNotification = "CartUpdateNotification"
    
    func postCartUpdateNotification() {
        center.post(name: cartUpdateNotification, object: nil)
    }
    
    func addObserverCartUpdateNotification(completion: @escaping OnCloseBlock) -> NotificationContext {
        return center.addObserver(forName: cartUpdateNotification) { _ in
            completion()
        }
    }
}
