//
//  BeverageInteractor.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit
import PromiseKit

protocol BeverageInteractor: Interactor {
    func getBeverage()
    func addToCart(_ beverage: BasePurchasableViewModel)
    func moveBack()
}

class DefaultBeverageInteractor: BaseInteractor {
    private let presenter: BeveragePresenter
    private let applicationContext: ApplicationContext
    
    private var beverage: [Beverage]?
    
    init(presenter: BeveragePresenter, applicationContext: ApplicationContext) {
        self.presenter = presenter
        self.applicationContext = applicationContext
    }
}

extension DefaultBeverageInteractor: BeverageInteractor {
    func getBeverage() {
        presenter.showLoadingView()
        
        _ = applicationContext.foodService.getBeverage().done { [weak self] beverage in
            self?.beverage = beverage
            self?.presenter.displayBeverage(beverage)
        }
    }
    
    func addToCart(_ beverage: BasePurchasableViewModel) {
        guard let drink = self.beverage?.first(where: { beverage.productName == $0.name }) else { return }
        
        applicationContext.cartStorageService.addPurchase(drink)
        presenter.showAddToCartBanner()
    }
    
    func moveBack() {
        presenter.moveBack()
    }
}
