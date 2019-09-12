//
//  PizzaLoadingView.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit
import Lottie

final class PizzaLoadingView: UIView {
    private let animationView = AnimationView()
    
    private let insets: CGFloat = 48
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        let animation = Animation.named("PizzaLoader")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        
        addSubview(animationView)
        
        let size = frame.width - insets * 2
        animationView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        animationView.center = center
        animationView.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin ,.flexibleBottomMargin]
        
        backgroundColor = BrandColor.black.asUIColor().withAlphaComponent(0.4)
        
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.setContentCompressionResistancePriority(.fittingSizeLevel, for: .horizontal)
        
        isHidden = true
    }
    
    func showLoading() {
        animationView.play(fromProgress: 0,
                           toProgress: 1,
                           loopMode: LottieLoopMode.loop,
                           completion: nil)
        isHidden = false
    }
    
    func hideLoading() {
        isHidden = true
        animationView.stop()
    }
}
