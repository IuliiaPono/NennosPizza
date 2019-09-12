//
//  BasePurchasableViewModel.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol BasePurchasableViewProperties: class {
    var cellType: BaseCellType { get }
    var productName: String { get }
    var productPrice: String { get }
}

final class BasePurchasableViewModel: CellViewModel, BasePurchasableViewProperties {
    let actionHandler: (_ model: BasePurchasableViewModel) -> Void
    
    let cellType: BaseCellType
    let productName: String
    let productPrice: String
    
    init(cellType: BaseCellType, name: String, price: String, actionHandler: @escaping (_ model: BasePurchasableViewModel) -> Void) {
        self.cellType = cellType
        self.productName = name
        self.productPrice = price
        
        self.actionHandler = actionHandler
    }
    
    func setup(cell: BasePurcasableViewCell) {
        cell.setup(with: self) { [weak self] in
            guard let self = self else { return }
            
            self.actionHandler(self)
        }
    }
}
