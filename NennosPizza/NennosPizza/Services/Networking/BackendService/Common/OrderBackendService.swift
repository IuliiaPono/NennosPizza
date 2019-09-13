//
//  OrderBackendService.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class OrderBackendService: BackendService {
    private let apiPath = "http://httpbin.org/"
    
    init() {
        let httpClient = AlamofireHttpClient(baseUrl: URL(string: apiPath)!, decoder: DictionaryDecoder())
        super.init(client: httpClient)
    }
}
