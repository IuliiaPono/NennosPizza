//
//  BasePurcasableViewCell.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

final class BasePurcasableViewCell: UITableViewCell, XibInitializable {
    private var actionHandler: (() -> Void)?
    
    @IBOutlet private var actionButton: UIButton!
    
    @IBOutlet private var productNameLabel: UILabel!
    
    @IBOutlet private var productPricelabel: UILabel!
    
    func setup(with model: BasePurchasableViewProperties, actionHandler: (() -> Void)?) {
        setupButtonImage(for: model.cellType)
        
        productNameLabel.text = model.productName
        productPricelabel.text = model.productPrice
        
        self.actionHandler = actionHandler
    }
    
    private func setupButtonImage(for cellType: BaseCellType) {
        let image = cellType.rightImage
        actionButton.setImage(image, for: .normal)
    }
    
    @IBAction private func doHandleActionButton() {
        actionHandler?()
    }
}
