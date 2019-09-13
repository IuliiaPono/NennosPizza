//
//  CartInteractor.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 12/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit
import PromiseKit

protocol CartInteractor: Interactor {
    func getPurchases()
    func openBeverage()
    func removeFromCart(_ purchase: BasePurchasableViewModel)
    func checkout()
    func moveBack()
}

class CartInteractorDefault: BaseInteractor {
    private let presenter: CartPresenter
    
    private let appManager: AppManager
    
    private var purchases: [Purchasable]?
    
    private var notificationContext: NotificationContext?
    
    init(presenter: CartPresenter, appManager: AppManager) {
        self.presenter = presenter
        self.appManager = appManager
        
        super.init()
        
        notificationContext = self.appManager.cartNotificationCenter.addObserverCartUpdateNotification { [weak self] in
            self?.getPurchases()
        }
    }
    
    deinit {
        notificationContext?.cancel()
    }
}

extension CartInteractorDefault: CartInteractor {
    
    func getPurchases() {
        let purchases = appManager.cartStorageService.getPurchases()
        self.purchases = purchases
        presenter.presentPurchases(purchases)
    }
    
    func openBeverage() {
        presenter.openBeverage(with: appManager)
    }
    
    func checkout() {
        presenter.showLoadingView()
        _ = appManager.cartService.orderFood(purchases: purchases ?? [])
        .done { [weak self] in
            guard let self = self else { return }

            self.presenter.openGratitude(with: self.appManager)
        }
        .catch({ [weak self] _ in
            self?.presenter.hideLoadingView()
        })
    }
    
    func removeFromCart(_ purchase: BasePurchasableViewModel) {
        guard let purchase = purchases?.first(where: { purchase.productName == $0.name }) else { return }
        
        appManager.cartStorageService.removePurchase(purchase)
    }
    
    func moveBack() {
        presenter.moveBack()
    }
}
