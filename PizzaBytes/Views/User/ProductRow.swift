//
//  ProductRow.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 11/02/23.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var cartManager: CartManager
    var pizza: Pizza
    
    var body: some View {
        HStack(spacing: 20) {
            Image(pizza.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("\(pizza.name)     $\(String(describing: pizza.size.first!.value as AnyObject)).00")
                    .bold()
                let sizeName: String = pizza.size.first!.key.capitalized
                let baseName: String = pizza.base.first!.name.capitalized
                let toppingName: String = pizza.topping.first!.name.capitalized
                Text("\(sizeName), \(baseName), \(toppingName)")
                    .font(.system(size: 10))
            }
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
                    cartManager.removeFromCart(pizza: pizza)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(pizza: pizzaList[3])
            .environmentObject(CartManager())
    }
}
