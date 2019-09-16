//
//  SupplementaryViewModel.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

public typealias AnySupplementaryView = UICollectionReusableView

public protocol AnySupplementaryViewModel: Reusable, Accessible {
    static var supplementaryKind: String { get }
    static var supplementaryViewClass: AnyClass { get }
    func setup(view: AnySupplementaryView)
    func height(constrainedBy maxWidth: CGFloat) -> CGFloat?
}

extension AnySupplementaryViewModel {
    public static var supplementaryKind: String {
        return UICollectionView.elementKindSectionHeader
    }
    public func height(constrainedBy maxWidth: CGFloat) -> CGFloat? {
        return nil
    }
}

public protocol SupplementaryViewModel: AnySupplementaryViewModel {
    associatedtype View: AnySupplementaryView
    func setup(view: View)
}

extension SupplementaryViewModel {
    public static var supplementaryViewClass: AnyClass {
        return View.self
    }
    
    public func setup(view: AnySupplementaryView) {
        guard let view = view as? View else { return }
        
        setup(view: view)
    }
}
