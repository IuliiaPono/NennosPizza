//
//  NotificationsCenterDefault.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class NotificationsCenterDefault: NotificationsCenter {
    
    func post(name: String, object: Any?) {
        NotificationCenter.default.post(name: Notification.Name(name), object: object)
    }
    
    func addObserver(forName name: String, block: @escaping (Any?) -> Void) -> NotificationContext {
        let token = NotificationCenter.default.addObserver(forName: Notification.Name(name),
                                                           object: nil,
                                                           queue: OperationQueue.main) { notification in
                                                            block(notification.object)
        }
        return NotificationContextDefault(token, center: self)
    }
}
