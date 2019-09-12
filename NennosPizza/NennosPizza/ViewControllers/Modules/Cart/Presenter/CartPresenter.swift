//
//  CartPresenter.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol CartPresenter: Presenter, BannerPresentable {
    func presentPurchases(_ purchases: [Purchasable])
    func openBeverage()
    func moveBack()
}

class CartPresenterDefault: BasePresenter {
    private weak var view: CartViewInput?
    
    init(router: Router, view: CartViewInput?) {
        super.init(router: router)
        self.view = view
    }
}

extension CartPresenterDefault: CartPresenter {
    func presentPurchases(_ purchases: [Purchasable]) {
        let viewModels = purchases.map { purchase -> BasePurchasableViewModel in
            return BasePurchasableViewModel(
                cellType: .deletable,
                name: purchase.name,
                price: purchase.price.priceString(),
                actionHandler: { [weak self] purchaseModel in
                    self?.view?.removeFromCart(purchaseModel)
                }
            )
        }
        
        let totalPrice = purchases.map { $0.price }.reduce(0, +)
        let stringTotalPrice = totalPrice.priceString()
        
        view?.display(viewModels, totalPrice: stringTotalPrice)
    }
    
    func openBeverage() {
//        router.push(DrinksAssembly.createModule())
    }
    
    func moveBack() {
        router.pop()
    }
}

