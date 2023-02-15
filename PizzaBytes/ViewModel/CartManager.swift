//
//  CartManager.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 11/02/23.
//

import Foundation

class CartManager: ObservableObject {
    
    @Published private(set) var pizzas : [Pizza] = []
    @Published private(set) var total : Int = 0
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
    }
    
    func addToCart(pizza: Pizza) {
        pizzas.append(pizza)
        
        for (_, value) in pizza.size  {
            total += value 
        }
    }
    
    func removeFromCart(pizza: Pizza) {
        pizzas = pizzas.filter { $0.id != pizza.id }
        
        for (_, value) in pizza.size  {
            total -= value
        }
    }
    
    func removeAllFromCart() {
        pizzas.removeAll()
    }
    
    func placeOrder(orderDetail: [Order]) {
        service.placeOrder(orderDetail: orderDetail){ result in
            DispatchQueue.main.async {
                switch result{
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    print(error)
                case .success(_):
                    self.savePlacedOrder(orderDetail: orderDetail)
                }
            }
        }
    }
    
    func savePlacedOrder(orderDetail: [Order]) {
        if let data = UserDefaults.standard.data(forKey: "orderDetail") {
            do {
                let decoder = JSONDecoder()
                var orderDetails = try decoder.decode([Order].self, from: data)
                orderDetails.append(contentsOf: orderDetail)
                saveOrderDataToUserDefault(orderDetail: orderDetails)
            } catch {
                print("Unable to Decode data (\(error))")
            }
        }
        else {
            saveOrderDataToUserDefault(orderDetail: orderDetail)
        }
    }
    
    func saveOrderDataToUserDefault(orderDetail: [Order]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(orderDetail)
            UserDefaults.standard.set(data, forKey: "orderDetail")
        } catch {
            print("Unable to Encode data (\(error))")
        }
    }
}
