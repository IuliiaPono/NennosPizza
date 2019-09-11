//
//  UIView+AttachmentToParent.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

extension UIView {
    func attachToParent(vc: UIViewController) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: vc.view.topAnchor),
            leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
            trailingAnchor.constraint(equalTo: vc.view.trailingAnchor),
            bottomAnchor.constraint(equalTo: vc.view.bottomAnchor)]
        )
    }
    
    func attachToParentBottom(vc: UIViewController) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
            trailingAnchor.constraint(equalTo: vc.view.trailingAnchor),
            bottomAnchor.constraint(equalTo: vc.view.bottomAnchor)]
        )
    }
    
    struct Edges: OptionSet {
        let rawValue: Int
        
        static let top      = Edges(rawValue: 1 << 0)
        static let left     = Edges(rawValue: 1 << 1)
        static let bottom   = Edges(rawValue: 1 << 2)
        static let right    = Edges(rawValue: 1 << 3)
        static let all      = Edges(rawValue: Int.max)
    }
    
    @discardableResult
    func fill(to parent: UIView, edges: Edges = .all) -> [NSLayoutConstraint] {
        var constraints: [NSLayoutConstraint] = []
        
        if edges.contains(.top) {
            constraints.append(topAnchor.constraint(equalTo: parent.topAnchor))
        }
        
        if edges.contains(.left) {
            constraints.append(leadingAnchor.constraint(equalTo: parent.leadingAnchor))
        }
        
        if edges.contains(.bottom) {
            constraints.append(bottomAnchor.constraint(equalTo: parent.bottomAnchor))
        }
        
        if edges.contains(.right) {
            constraints.append(trailingAnchor.constraint(equalTo: parent.trailingAnchor))
        }
        
        NSLayoutConstraint.activate(constraints)
        
        return constraints
    }
}
