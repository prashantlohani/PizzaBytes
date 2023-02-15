//
//  APIMockService.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 14/02/23.
//  Mocking the API functions and returning success

import Foundation

struct APIService : APIServiceProtocol {
    
    func placeOrder(orderDetail: [Order], completionHandler: @escaping (Result<Bool, APIError>) -> Void) {
        completionHandler(Result.success(true))
    }
    
    func fetchOrder(completionHandler: @escaping (Result<[Order], APIError>) -> Void) {
        completionHandler(.success(orderExample))
    }
    
}
