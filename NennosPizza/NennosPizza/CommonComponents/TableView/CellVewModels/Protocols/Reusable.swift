//
//  Reusable.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

public protocol Reusable {
    static var uniqueIdentifier: String { get }
}

extension Reusable {
    public static var uniqueIdentifier: String {
        return String(describing: self)
    }
}
