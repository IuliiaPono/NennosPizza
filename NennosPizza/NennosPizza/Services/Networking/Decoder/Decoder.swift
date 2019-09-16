//
//  Decoder.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

protocol Decoder {
    func decode<T>(_ type: T.Type, from data: Any) throws -> T where T: Decodable
}

enum DecoderError: Error, CustomStringConvertible {
    case parsing(response: Any)
    
    var description: String {
        var description = ""
        
        switch self {
        case let .parsing(response):
            description = "Failed response: \(response as? CustomStringConvertible ?? "Unrecognized data.")"
        }
        
        return description
    }
}
