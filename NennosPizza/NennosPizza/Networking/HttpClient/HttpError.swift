//
//  HttpError.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

enum HttpError: Error, CustomStringConvertible {
    
    case validation(statusCode: Int, response: CustomStringConvertible?)
    case backend(error: BackendError, httpStatusCode: Int?)
    case parsing(response: Any)
    
    var description: String {
        var description = ""
        
        switch self {
        case let .validation(statusCode, response):
            description = "Response: \(response ?? "Unresolved data.")" + "\nStatus code: \(statusCode)"
            
        case let .backend(error, httpStatusCode):
            description = "Server error: \(error.description). Code: \(error.сode)."
            
            if let statusCodeValue = httpStatusCode {
                description += " HTTP status: \(statusCodeValue)"
            }
            
        case let .parsing(response):
            description = "Response: \(response as? CustomStringConvertible ?? "Unresolved data.")"
        }
        
        return description
    }
}
