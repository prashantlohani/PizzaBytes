//
//  CatViewUITests.swift
//  PizzaBytesUITests
//
//  Created by Prashant Lohani on 21/02/23.
//

import XCTest

final class CartViewUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func test_CartView_checkoutButton_shouldNotPlaceOrder() {
        //Given
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.button, identifier:"Add").children(matching: .button).matching(identifier: "Add").element(boundBy: 0).tap()
        app.buttons["Add To Cart"].tap()
        
        let pizzaBytesNavigationBar = app.navigationBars["Pizza Bytes"]
        pizzaBytesNavigationBar/*@START_MENU_TOKEN@*/.buttons["1"]/*[[".otherElements[\"1\"].buttons[\"1\"]",".buttons[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        let textName = elementsQuery.textFields["nameField"]
        let textPhone = elementsQuery.textFields["phoneField"]
        let textAddress = elementsQuery.textFields["addressField"]
        //When
        textName.tap()
        textPhone.tap()
        textAddress.tap()
        
        let checkoutButton = app.buttons["Place Order"]
        checkoutButton.tap()
        
        let navBar = app.navigationBars["Pizza Bytes"]
        
        //Then
        XCTAssertFalse(navBar.exists)
    }
    
    func test_CartView_checkoutButton_shouldPlaceOrder() {
        //Given
        let scrollViewsQuery = app.scrollViews
        scrollViewsQuery.otherElements.containing(.button, identifier:"Add").children(matching: .button).matching(identifier: "Add").element(boundBy: 0).tap()
        app.buttons["Add To Cart"].tap()
        
        let pizzaBytesNavigationBar = app.navigationBars["Pizza Bytes"]
        pizzaBytesNavigationBar/*@START_MENU_TOKEN@*/.buttons["1"]/*[[".otherElements[\"1\"].buttons[\"1\"]",".buttons[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let elementsQuery = app.scrollViews.otherElements
        let textName = elementsQuery.textFields["nameField"]
        let textPhone = elementsQuery.textFields["phoneField"]
        let textAddress = elementsQuery.textFields["addressField"]
        
        //When
        textName.tap()
        let keyA = app.keys["J"]
        keyA.tap()
        let keyo = app.keys["o"]
        keyo.tap()
        let keyn = app.keys["n"]
        keyn.tap()
        
        
        textPhone.tap()
        let key6 = app.keys["6"]
        key6.tap()
        key6.tap()
        let key4 = app.keys["4"]
        key4.tap()
        key6.tap()
        key4.tap()
        let key2 = app.keys["2"]
        key2.tap()
        key6.tap()
        key2.tap()
        key4.tap()
        
        
        textAddress.tap()
        let keyN = app.keys["N"]
        keyN.tap()
        let keyz = app.keys["z"]
        keyz.tap()

        
        let checkoutButton = app.buttons["Place Order"]
        checkoutButton.tap()
        
        let navBar = app.navigationBars["Pizza Bytes"]
        
        //Then
        XCTAssertTrue(navBar.exists)
    }
}
