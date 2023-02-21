//
//  DriverView.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 15/02/23.
//

import SwiftUI

struct DriverView: View {
    
    @StateObject var orderManagerVM = OrderManager()
    
    var body: some View {
        ScrollView {
            if(orderManagerVM.isLoading)
            {
                LoadingView()
            } else if(orderManagerVM.errorMessage != nil){
                ErrorView(orderManagerVM: orderManagerVM)
            }
            else{
                if orderManagerVM.orders.count > 0 {
                    ForEach(orderManagerVM.orders, id: \.id) {
                        order in
                        if order.isDelivered {
                            OrderRow(order: order)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        orderManagerVM.updateOrder(order: order)
                                    }
                                }
                        }
                        
                    }
                }else {
                    Text("No orders to show")
                }
            }
        }
        .padding(.top)
    }
}

struct DriverView_Previews: PreviewProvider {
    static var previews: some View {
        DriverView()
            .environmentObject(OrderManager())
    }
}
