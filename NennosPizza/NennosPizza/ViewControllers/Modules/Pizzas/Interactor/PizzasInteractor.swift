//
//  PizzasInteractor.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit
import PromiseKit

protocol PizzasInteractor: Interactor {
    func getPizzasList()
    func openCart()
    func addToCart(_ pizza: PizzaBasicCellViewModel)
    func openDetails(_ pizza: PizzaBasicCellViewModel)
}

class PizzasInteractorDefault: BaseInteractor {
    private let presenter: PizzasPresenter
    private let appManager: AppManager
    
    private var pizzas: [Pizza]?
    
    init(presenter: PizzasPresenter, appManager: AppManager) {
        self.presenter = presenter
        self.appManager = appManager
        
        super.init()
    }
}

extension PizzasInteractorDefault: PizzasInteractor {
    func getPizzasList() {
        presenter.showLoadingView()
        _ = appManager.foodService.getIngredients().then { ingredients in
            return self.appManager.foodService.getPizzas(ingredients: ingredients)
        }.done { [weak self] pizzas in
            guard let self = self else { return }
            self.pizzas = pizzas
            self.presenter.displayPizzas(pizzas, imageLoader: self.appManager.imageDownloader)
        }
    }
    
    func openCart() {
        presenter.openCart(with: appManager)
    }
    
    func addToCart(_ pizza: PizzaBasicCellViewModel) {
        guard let pizza = pizzas?.first(where: { pizza.name == $0.name }) else { return }
        
        appManager.cartStorageService.addPurchase(pizza)
        presenter.showAddToCartBanner()
    }
    
    func openDetails(_ pizza: PizzaBasicCellViewModel) {
        //presenter.openPizzaDetails()
    }
}
