//
//  StorageServiceDefault.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class StorageServiceDefault {
    let storage: StorageService
    
    init() {
        self.storage = CachingStorageService()
    }
    
    init(storage: StorageService) {
        self.storage = storage
    }
}
