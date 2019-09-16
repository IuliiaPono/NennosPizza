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

class DefaultCartInteractor: BaseInteractor {
    private let presenter: CartPresenter
    
    private let applicationContext: ApplicationContext
    
    private var purchases: [Purchasable]?
    
    private var notificationContext: NotificationContext?
    
    init(presenter: CartPresenter, applicationContext: ApplicationContext) {
        self.presenter = presenter
        self.applicationContext = applicationContext
        
        super.init()
        
        notificationContext = self.applicationContext.cartNotificationCenter.addObserverCartUpdateNotification { [weak self] in
            self?.getPurchases()
        }
    }
    
    deinit {
        notificationContext?.cancel()
    }
}

extension DefaultCartInteractor: CartInteractor {
    
    func getPurchases() {
        let purchases = applicationContext.cartStorageService.getPurchases()
        self.purchases = purchases
        presenter.presentPurchases(purchases)
    }
    
    func openBeverage() {
        presenter.openBeverage(with: applicationContext)
    }
    
    func checkout() {
        presenter.showLoadingView()
        _ = applicationContext.cartService.orderFood(purchases: purchases ?? [])
        .done { [weak self] in
            guard let self = self else { return }

            self.applicationContext.cartStorageService.removePurchases()
            self.presenter.openGratitude(with: self.applicationContext)
        }
        .catch({ [weak self] _ in
            self?.presenter.hideLoadingView()
        })
    }
    
    func removeFromCart(_ purchase: BasePurchasableViewModel) {
        guard let purchase = purchases?.first(where: { purchase.productName == $0.name }) else { return }
        
        applicationContext.cartStorageService.removePurchase(purchase)
    }
    
    func moveBack() {
        presenter.moveBack()
    }
}
