//
//  BrandView.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 09/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

final class BrandView: UIView {
    
    @IBInspectable var brandConfigId: String = "none" {
        didSet {
            guard let config = BrandViewConfig.makeConfig(for: self.brandConfigId) else { assertionFailure(); return }
            
            self.backgroundColor = config.bgColor.asUIColor()
            self.alpha = config.alpha
        }
    }
}

private struct BrandViewConfig {
    
    let bgColor: BrandColor
    let alpha: CGFloat
    
    static func makeConfig(for id: String) -> BrandViewConfig? {
        switch id {
        case "redSemiTransparent":
            return BrandViewConfig(bgColor: .red, alpha: 0.8)
        case "whiteSemiTransparent":
            return BrandViewConfig(bgColor: .white, alpha: 0.8)
        case "lightGray":
            return BrandViewConfig(bgColor: .lightGray, alpha: 1.0)
        case "red":
            return BrandViewConfig(bgColor: .red, alpha: 1.0)
        default:
            return nil
        }
    }
}
