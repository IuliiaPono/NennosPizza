//
//  PizzaJSONTests.swift
//  NennosPizzaTests
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import XCTest
@testable import NennosPizza

final class PizzaJSONTests: XCTestCase {
    private let decoder = JSONDecoder()
    
    func testInitDecoder_correct() {
        let data = jsonData(name: "correct_pizza")
        
        let pizza = try? decoder.decode(BackendPizzasObject.self, from: data)
        
        XCTAssertNotNil(pizza)
        
        XCTAssertEqual(pizza!.basePrice, 4)
        XCTAssertEqual(
            pizza?.pizzas,
            [
                BackendPizzaObject(name: "Primavera", ingredients: [1, 5, 6], imageUrl: "https://i.ibb.co/XD5kYNd/primavera.png"),
                BackendPizzaObject(name: "Mare Bianco", ingredients: [1, 9, 10], imageUrl: nil)
            ])
    }
    
    func testInitDecoder_wrong() {
        let data = jsonData(name: "wrong_pizza")
        
        let pizza = try? decoder.decode(BackendPizzasObject.self, from: data)
        
        XCTAssertNil(pizza)
    }
    
    private func jsonData(name: String) -> Data {
        let bundle = Bundle(for: NennosPizzaTests.self)
        let path = bundle.path(forResource: name, ofType: "json")
        
        XCTAssertNotNil(path)
        
        let url = URL(fileURLWithPath: path!)
        let data = try? Data(contentsOf: url)
        
        XCTAssertNotNil(data)
        
        return data!
    }
}

