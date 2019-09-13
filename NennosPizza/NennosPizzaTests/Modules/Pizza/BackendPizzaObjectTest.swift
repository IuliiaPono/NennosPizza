//
//  BackendPizzaObjectTest.swift
//  NennosPizzaTests
//
//  Created by Iuliia Ponomareva on 13/09/2019.
//  Copyright © 2019 Iuliia Ponomareva. All rights reserved.
//

import XCTest
@testable import NennosPizza

final class BackendPizzaObjectTest: XCTestCase {
    private var backendPizza: BackendPizzaObject!
    
    override func setUp() {
        super.setUp()
        backendPizza = BackendPizzaObject(name: "Four Cheese", ingredients: [1, 2, 3], imageUrl: nil)
    }
    
    func testInit() {
        XCTAssertEqual(backendPizza.name, "Four Cheese")
        XCTAssertEqual(backendPizza.ingredients, [1, 2, 3])
        XCTAssertEqual(backendPizza.imageUrl, nil)
    }
    
    func testContainer() {
        let container = backendPizza.container
        
        guard let dictionary = container as? [String: Any] else {
            XCTFail("Container should be dictionary")
            return
        }
        
        let keys = dictionary.keys
        XCTAssertTrue(keys.contains("name"))
        XCTAssertTrue(keys.contains("ingredients"))
        XCTAssertTrue(keys.contains("imageURL"))
        
        XCTAssertEqual(dictionary["name"] as! String, backendPizza.name)
        XCTAssertEqual(dictionary["ingredients"] as! [Int], backendPizza.ingredients)
        XCTAssertEqual(dictionary["imageURL"] as? String, backendPizza.imageUrl)
    }
}

