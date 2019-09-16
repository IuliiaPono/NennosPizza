//
//  CartFooterView.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

final class CartFooterView: UIView, XibInitializable {
    @IBOutlet private var priceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        loadFromXib()
        
        updateSum()
    }
    
    func updateSum(with price: String = "0.0") {
        priceLabel.text = price
    }
}

extension CartFooterView {
    static func estimatedHeight() -> CGFloat {
        return 88.0
    }
}
