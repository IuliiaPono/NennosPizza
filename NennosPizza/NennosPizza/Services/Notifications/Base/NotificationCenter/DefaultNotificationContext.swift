//
//  DefaultNotificationContext.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class DefaultNotificationContext: NotificationContext {
    
    fileprivate let token: NSObjectProtocol
    private weak var center: DefaultNotificationsCenter?
    
    init(_ token: NSObjectProtocol,
         center: DefaultNotificationsCenter) {
        
        self.token = token
        self.center = center
    }
    
    func cancel() {
        center?.removeObserver(context: self)
    }
}

extension DefaultNotificationsCenter {
    
    func removeObserver(context: DefaultNotificationContext) {
        NotificationCenter.default.removeObserver(context.token)
    }
}
