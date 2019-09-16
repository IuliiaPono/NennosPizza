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
}

class DefaultPizzasInteractor: BaseInteractor {
    private let presenter: PizzasPresenter
    private let applicationContext: ApplicationContext
    
    private var pizzas: [Pizza]?
    
    init(presenter: PizzasPresenter, applicationContext: ApplicationContext) {
        self.presenter = presenter
        self.applicationContext = applicationContext
        
        super.init()
    }
}

extension DefaultPizzasInteractor: PizzasInteractor {
    func getPizzasList() {
        presenter.showLoadingView()
        _ = applicationContext.foodService.getIngredients().then { ingredients in
            return self.applicationContext.foodService.getPizzas(ingredients: ingredients)
        }.done { [weak self] pizzas in
            guard let self = self else { return }
            self.pizzas = pizzas
            self.presenter.displayPizzas(pizzas, imageLoader: self.applicationContext.imageDownloader)
        }
    }
    
    func openCart() {
        presenter.openCart(with: applicationContext)
    }
    
    func addToCart(_ pizza: PizzaBasicCellViewModel) {
        guard let pizza = pizzas?.first(where: { pizza.name == $0.name }) else { return }
        
        applicationContext.cartStorageService.addPurchase(pizza)
        presenter.showAddToCartBanner()
    }
}
