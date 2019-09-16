//
//  XibInitializable.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

public protocol XibInitializable: class {
    static var xibFileName: String { get }
}

extension XibInitializable where Self: UIView {
    public static var xibFileName: String {
        return String(describing: self)
    }
    
    public func loadFromXib() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: type(of: self).xibFileName, bundle: bundle)
        guard let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Object not found")
        }
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        contentView.fill(to: self)
    }
}

extension XibInitializable where Self: UIViewController {
    public static var xibFileName: String {
        return String(describing: self)
    }
    
    public static func instantiateFromXib() -> Self {
        return Self(nibName: xibFileName, bundle: Bundle(for: self))
    }
}

