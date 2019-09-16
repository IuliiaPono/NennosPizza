//
//  JSONSerializer.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation
import CoreGraphics

protocol JSONSerializable {
    var container: Any { get }
}

extension String: JSONSerializable {
    var container: Any {
        return self
    }
}

extension CGFloat: JSONSerializable {
    var container: Any {
        return self
    }
}

extension Float: JSONSerializable {
    var container: Any {
        return self
    }
}

extension Double: JSONSerializable {
    var container: Any {
        return self
    }
}

extension Int: JSONSerializable {
    var container: Any {
        return self
    }
}

extension NSNumber: JSONSerializable {
    var container: Any {
        return self
    }
}

extension NSNull: JSONSerializable {
    var container: Any {
        return self
    }
}

extension Array: JSONSerializable where Element: JSONSerializable {
    var container: Any {
        return map { $0.container }
    }
}

extension Dictionary: JSONSerializable where Value == JSONSerializable {
    var container: Any {
        return mapValues { $0.container }
    }
}
