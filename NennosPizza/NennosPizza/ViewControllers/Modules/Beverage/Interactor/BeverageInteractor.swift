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

class BeverageInteractorDefault: BaseInteractor {
    private let presenter: BeveragePresenter
    private let appManager: AppManager
    
    private var beverage: [Beverage]?
    
    init(presenter: BeveragePresenter, appManager: AppManager) {
        self.presenter = presenter
        self.appManager = appManager
    }
}

extension BeverageInteractorDefault: BeverageInteractor {
    func getBeverage() {
        presenter.showLoadingView()
        
        _ = appManager.foodService.getBeverage().done { [weak self] beverage in
            self?.beverage = beverage
            self?.presenter.displayBeverage(beverage)
        }
    }
    
    func addToCart(_ beverage: BasePurchasableViewModel) {
        guard let drink = self.beverage?.first(where: { beverage.productName == $0.name }) else { return }
        
        appManager.cartStorageService.addPurchase(drink)
        presenter.showAddToCartBanner()
    }
    
    func moveBack() {
        presenter.moveBack()
    }
}
