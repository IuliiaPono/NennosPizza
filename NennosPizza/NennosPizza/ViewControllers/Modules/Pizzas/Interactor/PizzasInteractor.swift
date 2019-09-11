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
    func openBasket()
    func addToCart(_ pizza: PizzaBasicCellViewModel)
    func openDetails(_ pizza: PizzaBasicCellViewModel)
}

class PizzasInteractorDefault: BaseInteractor {
    private let presenter: PizzasPresenter
    private let foodBackendService: FoodBackendService
    private let imageDownloader: ImageDownloader
    
    private var pizzas: [Pizza]?
    
    init(presenter: PizzasPresenter, foodBackendService: FoodBackendService) {
        self.presenter = presenter
        self.foodBackendService = foodBackendService
        self.imageDownloader = ImageDownloaderDefault()
    }
}

extension PizzasInteractorDefault: PizzasInteractor {
    func getPizzasList() {
        presenter.showLoadingView()
        _ = foodBackendService.getIngredients().then { ingredients in
            return self.foodBackendService.getPizzas(ingredients: ingredients)
        }.done { [weak self] pizzas in
            self?.pizzas = pizzas
            self?.presenter.displayPizzas(pizzas)
        }
    }
    
    func openBasket() {
        
    }
    
    func addToCart(_ pizza: PizzaBasicCellViewModel) {
        guard let pizza = pizzas?.first(where: { pizza.name == $0.name }) else { return }
        
        //
    }
    
    func openDetails(_ pizza: PizzaBasicCellViewModel) {
        //presenter.openPizzaDetails()
    }
}
