//
//  NotificationsCenter.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

protocol NotificationsCenter {
    func post(name: String, object: Any?)
    func addObserver(forName name: String, block: @escaping (Any?) -> Void) -> NotificationContext
}
