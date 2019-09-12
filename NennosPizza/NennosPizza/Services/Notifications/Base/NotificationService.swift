//
//  NotificationService.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class NotificationsService {
    
    let center: NotificationsCenter
    
    init() {
        self.center = NotificationsCenterDefault()
    }
    
    init(center: NotificationsCenter) {
        self.center = center
    }
}
