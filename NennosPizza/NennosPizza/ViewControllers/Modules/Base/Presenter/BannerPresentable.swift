//
//  BannerPresentable.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import Foundation

protocol BannerPresentable {
    func showAddToCartBanner()
}

extension BannerPresentable where Self: BasePresenter {
    
    func showAddToCartBanner() {
        router.presentBanner()
    }
}
