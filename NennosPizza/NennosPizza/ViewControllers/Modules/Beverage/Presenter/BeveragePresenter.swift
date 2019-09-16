//
//  BeveragePresenter.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol BeveragePresenter: Presenter, BannerPresentable {
    func displayBeverage(_ beverage: [Beverage])
    func moveBack()
}

class DefaultBeveragePresenter: BasePresenter {
    private weak var view: BeverageViewInput?
    
    init(router: Router, view: BeverageViewInput?) {
        super.init(router: router)
        
        self.view = view
    }
}

extension DefaultBeveragePresenter: BeveragePresenter {
    func displayBeverage(_ beverage: [Beverage]) {
        let viewModels = beverage.map { drink -> BasePurchasableViewModel in
            return BasePurchasableViewModel(
                cellType: .addable,
                name: drink.name,
                price: drink.price.priceString(),
                actionHandler: { [weak self] model in
                    self?.view?.addPurchaseToCart(with: model)
                }
            )
        }
        
        hideLoadingView()
        view?.display(viewModels)
    }
    
    func moveBack() {
        router.pop()
    }
}
