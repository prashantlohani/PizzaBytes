//
//  ErrorView.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 16/02/23.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var orderManagerVM : OrderManager
    
    var body: some View {
        VStack{
            Text("Loading Fails..")
                .font(.system(size: 48))
            Text(orderManagerVM.errorMessage ?? "")
            
            Button{
                orderManagerVM.fetchAllOrders()
            }label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(orderManagerVM: OrderManager())
    }
}
