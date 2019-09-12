//
//  StorageService.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

protocol StorageService: class {
    func save(object: Any, for key: String)
    func getObject(for key: String) -> Any?
    func removeObject(for key: String)
    func removeAll()
}
