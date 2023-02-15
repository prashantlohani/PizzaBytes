//
//  APIServiceMockTest.swift
//  PizzaBytesTests
//
//  Created by Prashant Lohani on 16/02/23.
//

import Foundation

struct APIServiceMock : APIServiceProtocol {
    
    var result: Result<[Order], APIError>
    
    func placeOrder(orderDetail: [Order], completionHandler: @escaping (Result<Bool, APIError>) -> Void) {
        completionHandler(.success(true))
    }
    func fetchOrder(completionHandler: @escaping (Result<[Order], APIError>) -> Void) {
        completionHandler(result)
    }
}
