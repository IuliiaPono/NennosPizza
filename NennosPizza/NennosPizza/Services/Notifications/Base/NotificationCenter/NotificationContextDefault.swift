//
//  NotificationContextDefault.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class NotificationContextDefault: NotificationContext {
    
    fileprivate let token: NSObjectProtocol
    private weak var center: NotificationsCenterDefault?
    
    init(_ token: NSObjectProtocol,
         center: NotificationsCenterDefault) {
        
        self.token = token
        self.center = center
    }
    
    func cancel() {
        center?.removeObserver(context: self)
    }
}

extension NotificationsCenterDefault {
    
    func removeObserver(context: NotificationContextDefault) {
        NotificationCenter.default.removeObserver(context.token)
    }
}
