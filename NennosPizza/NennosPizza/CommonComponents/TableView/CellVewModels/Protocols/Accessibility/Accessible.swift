//
//  Accessible.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

public protocol Accessible {
    var accessibilityIdentifier: String? { get }
    var accessibilityOptions: AccessibilityDisplayOptions { get }
}

extension Accessible {
    
    public var accessibilityIdentifier: String? {
        return nil
    }
    
    public var accessibilityOptions: AccessibilityDisplayOptions {
        return .none
    }
    
    public func accessibilityIdentifier(for indexPath: IndexPath) -> String? {
        guard let accessibilityIdentifier = accessibilityIdentifier else {
            return nil
        }
        let options = accessibilityOptions
        if options.contains(.section) && options.contains(.row) {
            return "\(accessibilityIdentifier)_\(indexPath.section)_\(indexPath.row)"
            
        } else if options.contains(.section) {
            return "\(accessibilityIdentifier)_\(indexPath.section)"
            
        } else if options.contains(.row) {
            return "\(accessibilityIdentifier)_\(indexPath.row)"
            
        } else {
            return accessibilityIdentifier
        }
    }
}
