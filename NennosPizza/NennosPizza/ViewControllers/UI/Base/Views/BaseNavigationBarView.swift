//
//  BaseNavigationBarView.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 11/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

final class BaseNavigationBarView: UIView, XibInitializable {
    
    @IBInspectable var titleImage: UIImage = UIImage() {
        didSet {
            backButton.setImage(titleImage, for: .normal)
        }
    }
    
    @IBInspectable var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var actionHandler: ((UIButton) -> Void)?
        
    private lazy var topToSuperviewConstraint: NSLayoutConstraint = {
        return containerView.topAnchor.constraint(equalTo: containerView.superview!.topAnchor)
    }()
    
    @IBOutlet private var topContainerConstraint: NSLayoutConstraint!
    
    @IBOutlet private var containerView: UIView!
    
    @IBOutlet private var backButton: UIButton!
    
    @IBOutlet private var titleLabel: BrandLabel!
    
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
        
        backButton.addTarget(self, action: #selector(actionBackButtonTapped(sender:)), for: .touchUpInside)
    }
    
    @objc private func actionBackButtonTapped(sender: UIButton) {
        actionHandler?(sender)
    }
    
    func attachToSuperview(in viewController: UIViewController, adjustSafeAreaInset: Bool = true) {
        topContainerConstraint.isActive = false
        
        if adjustSafeAreaInset {
            let topInset: CGFloat
            if #available(iOS 11.0, *) {
                topInset = viewController.view.safeAreaInsets.top
            } else {
                topInset = viewController.topLayoutGuide.length
            }
            topToSuperviewConstraint.constant = topInset
        }
        
        topToSuperviewConstraint.isActive = true
    }
    
    func attachToSafeArea(in viewController: UIViewController) {
        if #available(iOS 11.0, *) {
            // do nothing - safe area inset configured in xib
        } else {
            topContainerConstraint.isActive = false
            viewController.topLayoutGuide.bottomAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        }
    }
}

