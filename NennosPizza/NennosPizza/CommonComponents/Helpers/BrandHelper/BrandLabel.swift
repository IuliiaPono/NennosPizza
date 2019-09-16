//
//  BrandLabel.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 09/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

private enum ConfigString: String {
    case redTitle
    case grayTitle
    case grayDescriptionTitle
    case grayNormalText
    case graySemiboldText
    case whiteBannerText
    case `default`
}

final class BrandLabel: UILabel {
    
    @IBInspectable var brandConfigId: String = "none"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupAppearance()
    }
    
    private func setupAppearance() {
        let configString: ConfigString = ConfigString(rawValue: self.brandConfigId) ?? .default
        guard let config = BrandLabelConfig.makeConfig(for: configString) else { assertionFailure(); return }
        
        self.textColor = config.color.asUIColor
        self.font = config.font.asUIFont
    }
}

private struct BrandLabelConfig {
    let color: BrandColor
    let font: BrandFont
    
    static func makeConfig(for string: ConfigString) -> BrandLabelConfig? {
        switch string {
        case .redTitle:
            return BrandLabelConfig(color: .red, font: .textSemibold)
        case .grayTitle:
            return BrandLabelConfig(color: .gray, font: .titleSemibold)
        case .grayDescriptionTitle:
            return BrandLabelConfig(color: .gray, font: .subtitleRegular)
        case .grayNormalText:
            return BrandLabelConfig(color: .gray, font: .textRegular)
        case .graySemiboldText:
            return BrandLabelConfig(color: .gray, font: .textSemibold)
        case .whiteBannerText:
            return BrandLabelConfig(color: .white, font: .subtitleRegular)
        default:
            return nil
        }
    }
}
