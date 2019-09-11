//
//  PizzasPresenter.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol PizzasPresenter: Presenter {
    func displayPizzas(_ pizzas: [Pizza])
}

class PizzasPresenterDefault: BasePresenter, PizzasPresenter {
    private weak var view: PizzasViewInput?
    
    let imageDownloader: ImageDownloader
    
    init(router: Router, view: PizzasViewInput?, imageDownloader: ImageDownloader) {
        self.imageDownloader = imageDownloader
        
        super.init(router: router)
        
        self.view = view
    }
    
    func displayPizzas(_ pizzas: [Pizza]) {
        let pizzaModels = pizzas.map { pizza -> PizzaBasicCellViewModel in
            let ingredients = ingredientsString(from: pizza.ingredients)
            let basePrice = "$" + "\(pizza.basePrice)"
            
            return PizzaBasicCellViewModel(
                name: pizza.name,
                ingredients: ingredients,
                imageURL: pizza.imageUrl,
                basePrice: basePrice,
                imageDownloader: imageDownloader,
                purchaseHandler: { pizzaModel in
                    self.view?.addPurchaseToCart(with: pizzaModel)
                }
            )
        }
        hideLoadingView()
        view?.display(pizzaModels)
    }
    
    private func ingredientsString(from ingredients: [Ingredient]) -> String {
        return ingredients.map { $0.name }.joined(separator: ", ")
    }
}
