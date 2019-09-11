//
//  HtttpClient.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation
import PromiseKit

protocol HttpClient {
    var decoder: Decoder { get }
    
    func get(path: String, parameters: [String: Any]?) -> Promise<Any>
    func post(path: String, parameters: [String: Any]?) -> Promise<Any>
}

extension HttpClient {
    
    func get(path: String, parameters: [String: Any]? = nil) -> Promise<Any> {
        return get(path: path, parameters: parameters)
    }
    
    func post(path: String, parameters: [String: Any]? = nil) -> Promise<Any> {
        return post(path: path, parameters: parameters)
    }
}
