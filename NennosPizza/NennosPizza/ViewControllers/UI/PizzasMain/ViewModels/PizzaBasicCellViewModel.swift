//
//  PizzaBasicCellViewModel.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

protocol PizzaBasicViewModelProperties: class {
    var name: String { get }
    var ingredients: String { get }
    var imageURL: String? { get }
    var basePrice: String { get }
}

final class PizzaBasicCellViewModel: CellViewModel, PizzaBasicViewModelProperties {
    let purchaseHandler: (_ model: PizzaBasicCellViewModel) -> Void
    let imageDownloader: ImageDownloader
    
    let name: String
    let ingredients: String
    let imageURL: String?
    let basePrice: String
    
    init(name: String, ingredients: String, imageURL: String?, basePrice: String, imageDownloader: ImageDownloader, purchaseHandler: @escaping (_ model: PizzaBasicCellViewModel) -> Void) {
        self.name = name
        self.ingredients = ingredients
        self.imageURL = imageURL
        self.basePrice = basePrice
        
        self.purchaseHandler = purchaseHandler
        self.imageDownloader = imageDownloader
    }
    
    func setup(cell: PizzaBasicTableViewCell) {
        cell.setup(with: self, imageDownloader: self.imageDownloader) { [weak self] in
            guard let self = self else { return }
            
            self.purchaseHandler(self)
        }
    }
}
