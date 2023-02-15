//
//  OrderRow.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 15/02/23.
//

import SwiftUI

struct OrderRow: View {
    
    @EnvironmentObject var orderManager: OrderManager
    var order: Order
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                let name: String = order.userName
                let phone: String = order.userPhone
                let address: String = order.userAddress
                let pizzas: [Pizza] = order.orderDetail
                HStack {
                    Image(systemName: order.isDelivered ? "checkmark.circle" : "circle")
                        .foregroundColor(order.isDelivered ? .green : .red)
                    Text("Deliver to: \(name), Phone: \(phone)\nAddress: \(address)")
                }
                ForEach(pizzas) { pizza in
                    HStack{
                        Text("\(pizza.name) $\(String(describing: pizza.size.first!.value as AnyObject)).00")
                            .font(.caption)
                        Text("[\(pizza.size.first!.key.capitalized), \(pizza.base.first!.name), \(pizza.topping.first!.name)]")
                            .font(.caption2)
                    }
                }
            }
        }
        .padding(20)
        .frame(maxWidth: 350)
        .foregroundColor(.white)
        .background(Color.accentColor)
        .background(.opacity(0.3))
        .cornerRadius(20)
    }
}

struct OrderRow_Previews: PreviewProvider {
    static var previews: some View {
        OrderRow(order: orderExample[0])
            .environmentObject(OrderManager())
    }
}
