//
//  OrderManager.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 15/02/23.
//

import Foundation

class OrderManager: ObservableObject {
    
    @Published var orders = [Order]()
    @Published var total : Int = 0
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        self.fetchAllOrders()
    }
    
    func updateOrder(order: Order) {
        if let index = orders.firstIndex(where: {$0.id == order.id}) {
            orders[index] = order.updateCompletion()
            
            updateOrderDataToUserDefault(orderDetail:orders)
        }
    }
    
    func fetchAllOrders(){
        isLoading = true
        errorMessage = nil
        
        service.fetchOrder{ result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result{
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .success(_):
                    self.orders = self.getOrderDataFromUserDefault()
                }
            }
        }
    }
    
    func getOrderDataFromUserDefault() -> [Order] {
        if let data = UserDefaults.standard.data(forKey: "orderDetail") {
            do {
                let decoder = JSONDecoder()
                let orderDetails = try decoder.decode([Order].self, from: data)
                return orderDetails
            } catch {
                print("Unable to Decode data (\(error))")
            }
            
        }
        return []
    }
    
    func updateOrderDataToUserDefault(orderDetail: [Order]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(orderDetail)
            UserDefaults.standard.set(data, forKey: "orderDetail")
        } catch {
            print("Unable to Encode data (\(error))")
        }
    }
}
