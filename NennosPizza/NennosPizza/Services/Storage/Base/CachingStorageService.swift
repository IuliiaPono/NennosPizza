//
//  CachingStorageService.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class CachingStorageService: StorageService {
    private static var storage = [String: Any]()
    
    func save(object: Any, for key: String) {
        CachingStorageService.storage[key] = object
    }
    
    func getObject(for key: String) -> Any? {
        return CachingStorageService.storage[key]
    }
    
    func removeObject(for key: String) {
        CachingStorageService.storage.removeValue(forKey: key)
    }
    
    func removeAll() {
        CachingStorageService.storage.removeAll()
    }
}
