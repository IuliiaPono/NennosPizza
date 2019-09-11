//
//  ProductsBackendService.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class ProductsBackendService: BackendService {
    private let apiPath = "https://api.myjson.com/bins/"
    
    init() {
        let httpClient = AlamofireHttpClient(baseUrl: URL(string: apiPath)!, decoder: DictionaryDecoder())
        super.init(client: httpClient)
    }
}
