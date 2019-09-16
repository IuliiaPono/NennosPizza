//
//  BrandActionButton.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 09/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

private enum ColorConfig: String {
    case red
    case yellow
    
    var color: BrandColor {
        switch self {
        case .red:
            return .red
        case .yellow:
            return .yellow
        }
    }
}

final class BrandActionButton: UIButton {
    @IBInspectable var settableButtonColor: String = "red" {
        didSet {
            colorCobfig = ColorConfig(rawValue: settableButtonColor) ?? .red
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            let config = Config.makeConfig(for: activeState)
            apply(config: config)
        }
    }
    
    private var colorCobfig: ColorConfig = .red
    
    private var activeState: Config.State {
        return isEnabled ? .active(config: colorCobfig) : .inactive
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        let config = Config.makeConfig(for: activeState)
        apply(config: config)
    }
    
    private func apply(config: Config) {
        self.layer.shadowColor = config.color.asUIColor.cgColor
        self.titleLabel?.font = config.font.asUIFont
        self.backgroundColor = config.color.asUIColor
        self.setTitleColor(config.fontColor.asUIColor, for: .normal)
        self.setTitleColor(config.fontColor.asUIColor, for: .highlighted)
    }
    
    private struct Config {
        let color: BrandColor
        let font: BrandFont
        let fontColor: BrandColor
        
        enum State {
            case active(config: ColorConfig)
            case inactive
        }
        
        static func makeConfig(for state: State) -> Config {
            switch state {
            case .inactive:
                return Config(color: .lightGray, font: .textSemibold, fontColor: .white)
            case .active(let config):
                return Config(color: config.color, font: .textSemibold, fontColor: .white)
            }
        }
    }
}
