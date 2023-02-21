//
//  PizzaBytesTests.swift
//  PizzaBytesTests
//
//  Created by Prashant Lohani on 15/02/23.
//

import XCTest
import Combine
@testable import PizzaBytes

final class PizzaBytesTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        subscriptions = []
    }
    // An ``AnyCancellable`` instance automatically calls ``Cancellable/cancel()`` when deinitialized.
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_order_mock_api_success(){
        let result = Result<[Order], APIError>.success(orderExample)
        let fetcher = OrderManager(service: APIServiceMock(result: result))
        
        let promise = expectation(description: "getting orders")
        
        //Sink => Returns: A cancellable instance, which you use when you end assignment of the received value. Deallocation of the result will tear down the subscription stream.
        fetcher.$orders.sink { orders in
            if orders.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        
        wait(for: [promise], timeout: 2)
    }
    
    func test_loading_error() {
        
        let result = Result<[Order], APIError>.failure(APIError.badURL)
        let fetcher = OrderManager(service: APIServiceMock(result: result))
        
        let promise = expectation(description: "show error message")
        fetcher.$orders.sink { orders in
            if !orders.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        
        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
    }
    
    
}
