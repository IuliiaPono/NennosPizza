//
//  DictionaryDecoder.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

class DictionaryDecoder: Decoder {
    private let decoder = JSONDecoder()
    
    func decode<T>(_ type: T.Type, from data: Any) throws -> T where T: Decodable {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
            throw DecoderError.parsing(response: data)
        }
        return try decoder.decode(type, from: jsonData)
    }
}
