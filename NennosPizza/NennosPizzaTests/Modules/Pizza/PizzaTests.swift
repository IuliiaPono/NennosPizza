//
//  PizzaTests.swift
//  NennosPizzaTests
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import XCTest
@testable import NennosPizza

final class PizzaTests: XCTestCase {
    private let ingredients: [Ingredient] = .default
    private var pizza: Pizza!
    
    override func setUp() {
        super.setUp()
        
        pizza = Pizza(name: "Four Seasons", ingredients: ingredients, imageUrl: "image/url", basePrice: 4.0)
    }
    
    func testInit() {
        XCTAssertEqual(pizza.name, "Four Seasons")
        XCTAssertEqual(pizza.ingredients, ingredients)
        XCTAssertEqual(pizza.basePrice, 4.0)
        XCTAssertEqual(pizza.imageUrl, "image/url")
    }
    
    func testPrice() {
        let price = pizza.price
        
        XCTAssertEqual(price, ingredients.map{ $0.price }.reduce(0, +) + pizza.basePrice)
    }
    
    func testRawPizza() {
        let rawPizza = pizza.rawPizza
        
        XCTAssertEqual(rawPizza.name, pizza.name)
        XCTAssertEqual(rawPizza.ingredients, pizza.ingredients.values(of: \.id))
        XCTAssertEqual(rawPizza.imageUrl, pizza.imageUrl)
    }
}
