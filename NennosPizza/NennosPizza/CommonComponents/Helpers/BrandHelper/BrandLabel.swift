//
//  BrandLabel.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 09/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

final class BrandLabel: UILabel {
    
    @IBInspectable var brandConfigId: String = "none"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let config = BrandLabelConfig.makeConfig(for: self.brandConfigId) else { assertionFailure(); return }
        
        self.textColor = config.color.asUIColor()
        self.font = config.font.asUIFont()
    }
}

private struct BrandLabelConfig {
    let color: BrandColor
    let font: BrandFont
    
    static func makeConfig(for id: String) -> BrandLabelConfig? {
        switch id {
        case "redTitle":
            return BrandLabelConfig(color: .red, font: .textSemibold)
        case "grayTitle":
            return BrandLabelConfig(color: .gray, font: .titleSemibold)
        case "grayDescriptionTitle":
            return BrandLabelConfig(color: .gray, font: .subtitleRegular)
        case "grayNormalText":
            return BrandLabelConfig(color: .gray, font: .textRegular)
        case "graySemiboldText":
            return BrandLabelConfig(color: .gray, font: .textSemibold)
        case "whiteBannerText":
            return BrandLabelConfig(color: .white, font: .subtitleRegular)
        default:
            return nil
        }
    }
}
