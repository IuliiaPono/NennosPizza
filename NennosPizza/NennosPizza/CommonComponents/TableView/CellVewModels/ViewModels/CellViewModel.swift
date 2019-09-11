//
//  CellViewModel.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

public typealias AnyViewCell = UIView

public protocol AnyCellViewModel: Reusable, Accessible {
    static var cellClass: AnyClass { get }
    func setup(cell: AnyViewCell)
    func height(constrainedBy maxWidth: CGFloat) -> CGFloat?
}

extension AnyCellViewModel {
    public func height(constrainedBy maxWidth: CGFloat) -> CGFloat? {
        return nil
    }
}

public protocol CellViewModel: AnyCellViewModel {
    associatedtype Cell: AnyViewCell
    func setup(cell: Cell)
}

extension CellViewModel {
    public static var cellClass: AnyClass {
        return Cell.self
    }
    
    public func setup(cell: AnyViewCell) {
        setup(cell: cell as! Cell)
    }
}
