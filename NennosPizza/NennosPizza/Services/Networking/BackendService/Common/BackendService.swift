//
//  BackendService.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class BackendService {
    
    let client: HttpClient
    
    init(client: HttpClient) {
        self.client = client
    }
}

extension BackendService {
    
    var clientDecoder: Decoder {
        return client.decoder
    }
}
