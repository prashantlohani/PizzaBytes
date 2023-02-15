//
//  Order.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 15/02/23.
//

import Foundation

struct Order : Codable, Identifiable {
    var id = UUID().uuidString
    var userName: String
    var userAddress: String
    var userPhone: String
    var isDelivered: Bool
    var orderDetail: [Pizza]
    var description: String {
        return "Name: \(userName), Address: \(userAddress), Phone: \(userPhone), orderDetail: \(orderDetail)"
    }
    
    init(id: String = UUID().uuidString, userName: String, userAddress: String, userPhone: String, isDelivered: Bool, orderDetail: [Pizza]) {
        self.id = id
        self.userName = userName
        self.userAddress = userAddress
        self.userPhone = userPhone
        self.isDelivered = isDelivered
        self.orderDetail = orderDetail
    }
    func updateCompletion() -> Order {
        return Order(userName: userName, userAddress: userAddress, userPhone: userPhone, isDelivered: !isDelivered, orderDetail: orderDetail)
    }
    
}

var orderExample = [PizzaBytes.Order(id: "BA1502E5-5AFC-4C1D-B690-DCFDCC8C720B", userName: "Prashant", userAddress: "567", userPhone: "5465467", isDelivered: false, orderDetail: [PizzaBytes.Pizza(id: "E55215CA-8B8C-48FF-BD6D-51EE023CB24F", name: "Big Hawaiian", image: "big hawaiian", size: ["small": 8], base: [PizzaBytes.Base(name: "Thin Crust")], topping: [PizzaBytes.Topping(name: "Extra Cheese")]),PizzaBytes.Pizza(id: "E55215CA-8B8C-48FF-BD6D-51EE023CB24F", name: "Big Hawaiian", image: "big hawaiian", size: ["small": 8], base: [PizzaBytes.Base(name: "Thin Crust")], topping: [PizzaBytes.Topping(name: "Extra Cheese")])])]
