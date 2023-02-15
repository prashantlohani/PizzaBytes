//
//  APIServiceProtocol.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 15/02/23.
//

import Foundation

protocol APIServiceProtocol {
   
    func placeOrder(orderDetail: [Order], completionHandler: @escaping(Result<Bool, APIError>) ->Void)
    
    func fetchOrder(completionHandler: @escaping(Result<[Order], APIError>)->Void)

}
