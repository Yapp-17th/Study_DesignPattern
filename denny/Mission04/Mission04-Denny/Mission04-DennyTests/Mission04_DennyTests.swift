//
//  Mission04_DennyTests.swift
//  Mission04-DennyTests
//
//  Created by denny on 2020/09/12.
//

import XCTest
@testable import Mission04_Denny

class Mission04_DennyTests: XCTestCase {

    override func setUpWithError() throws {
        print("Before Performing Test")
    }

    override func tearDownWithError() throws {
        print("Test Ended")
    }
    
    func testPizzaGeneration() {
        let cheezePizza = PizzaStore.shared.createPizza(menu: "cheese")
        XCTAssertTrue(cheezePizza is CheezePizza)
        
        let peperoniPizza = PizzaStore.shared.createPizza(menu: "peperoni")
        XCTAssertTrue(peperoniPizza is PeperoniPizza)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
