//
//  JSONSerializer.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation
import CoreGraphics

protocol JSONSerializaber {
    var container: Any { get }
}

extension String: JSONSerializaber {
    var container: Any {
        return self
    }
}

extension CGFloat: JSONSerializaber {
    var container: Any {
        return self
    }
}

extension Float: JSONSerializaber {
    var container: Any {
        return self
    }
}

extension Double: JSONSerializaber {
    var container: Any {
        return self
    }
}

extension Int: JSONSerializaber {
    var container: Any {
        return self
    }
}

extension NSNumber: JSONSerializaber {
    var container: Any {
        return self
    }
}

extension NSNull: JSONSerializaber {
    var container: Any {
        return self
    }
}

extension Array: JSONSerializaber where Element: JSONSerializaber {
    var container: Any {
        return map { $0.container }
    }
}

extension Dictionary: JSONSerializaber where Value == JSONSerializaber {
    var container: Any {
        return mapValues { $0.container }
    }
}
