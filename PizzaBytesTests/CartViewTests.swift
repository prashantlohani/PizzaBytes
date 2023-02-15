//
//  CartViewTests.swift
//  PizzaBytesTests
//
//  Created by Prashant Lohani on 16/02/23.
//

import XCTest
@testable import PizzaBytes

final class CartViewTests: XCTestCase {
    
    var sut : CartView!

    override func setUpWithError() throws {
        sut = CartView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    
    func testUserValuesForNull() {
        let name1 = "prashant"
        let name2 = ""
        let phone = "899876665"
        let address = "Chester Street, Christchurch"
        
        let result1 = sut.textIsAppropriate(name: name1, phone: phone, address: address)
        XCTAssertEqual(result1, true)

        let result2 = sut.textIsAppropriate(name: name2, phone: phone, address: address)
        XCTAssertEqual(result2, false)
    }
    
    func testValidPhoneNumber() {
        let phoneNo1 = "9876532223"
        let phoneNo2 = "abc43536"
        
        let result1 = sut.isValidPhone(phone: phoneNo1)
        XCTAssertEqual(result1, true)
        
        let result2 = sut.isValidPhone(phone: phoneNo2)
        XCTAssertEqual(result2, false)
    }

}
