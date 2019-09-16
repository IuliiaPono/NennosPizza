//
//  PizzaBasicTableViewCell.swift
//  NennosPizza
//
//  Created by Iuliia Ponomareva on 10/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import UIKit

final class PizzaBasicTableViewCell: UITableViewCell, XibInitializable {
    private var purchaseHandler: (() -> Void)?
    
    @IBOutlet private var pizzaImageView: UIImageView!
    
    @IBOutlet private var pizzaNameLabel: UILabel!
    
    @IBOutlet private var pizzaDescriptionLabel: UILabel!
    
    @IBOutlet private var cartButton: UIButton!
    
    func setup(with model: PizzaBasicViewModelProperties, imageDownloader: ImageDownloader, purchaseHandler: (() -> Void)?) {
        setupImage(from: model.imageURL, with: imageDownloader)
        
        setupPrice(model.basePrice)
        
        setupTitles(for: model.name, pizzaDescription: model.ingredients)
        
        self.purchaseHandler = purchaseHandler
    }
    
    private func setupPrice(_ price: String) {
        cartButton.setTitle(price, for: .normal)
    }
    
    private func setupImage(from imagePath: String?, with imageDownloader: ImageDownloader) {
        let defaultPizzaImageName = "bg_wood"
        if let imageURL = imagePath {
            imageDownloader.loadImage(from: imageURL, into: pizzaImageView, defaultImageName: defaultPizzaImageName)
        } else {
            pizzaImageView.image = UIImage(named: defaultPizzaImageName)
        }
    }
    
    private func setupTitles(for pizzaName: String, pizzaDescription: String) {
        pizzaNameLabel.text = pizzaName
        pizzaDescriptionLabel.text = pizzaDescription
    }
    
    @IBAction private func doAddToCart() {
        purchaseHandler?()
    }
}
