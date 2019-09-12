//
//  PizzasPresenter.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol PizzasPresenter: Presenter, BannerPresentable {
    func displayPizzas(_ pizzas: [Pizza], imageLoader: ImageDownloader)
    func openCart(with appManager: AppManager)
}

class PizzasPresenterDefault: BasePresenter, PizzasPresenter {
    private weak var view: PizzasViewInput?
    
    init(router: Router, view: PizzasViewInput?) {
        super.init(router: router)
        
        self.view = view
    }
    
    func displayPizzas(_ pizzas: [Pizza], imageLoader: ImageDownloader) {
        let pizzaModels = pizzas.map { pizza -> PizzaBasicCellViewModel in
            let ingredients = ingredientsString(from: pizza.ingredients)
            
            return PizzaBasicCellViewModel(
                name: pizza.name,
                ingredients: ingredients,
                imageURL: pizza.imageUrl,
                basePrice: pizza.price.priceString(),
                imageDownloader: imageLoader,
                purchaseHandler: { pizzaModel in
                    self.view?.addPurchaseToCart(with: pizzaModel)
                }
            )
        }
        hideLoadingView()
        view?.display(pizzaModels)
    }
    
    func openCart(with appManager: AppManager) {
        router.push(CartCoordinator.createModule(with: appManager))
    }
    
    private func ingredientsString(from ingredients: [Ingredient]) -> String {
        return ingredients.map { $0.name }.joined(separator: ", ")
    }
}
