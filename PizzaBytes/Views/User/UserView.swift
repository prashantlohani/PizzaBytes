//
//  ContentView.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 15/02/23.
//

import SwiftUI

struct UserView: View {
    
    @StateObject var cartManager = CartManager()
    @StateObject var orderManager = OrderManager()
    @State var selected = 1
    
    var body: some View {
        
        VStack {
            Picker(selection: $selected, label: Text("Picker"), content: {
                Text("User 🍕").tag(1)
                Text("Driver 🚖").tag(2)
            })
            .pickerStyle(SegmentedPickerStyle())
            
            if selected == 1 {
                ScrollView {
                    VStack {
                        ForEach(pizzaList, id: \.id) {
                            PizzaTypes in PizzaCard(pizza: PizzaTypes)
                                .environmentObject(cartManager)
                        }
                    }
                    .padding()
                }
                .navigationTitle(Text("Pizza Bytes"))
                .toolbar {
                    NavigationLink {
                        CartView()
                            .environmentObject(cartManager)
                    } label: {
                        CartButton(numberOfProducts: cartManager.pizzas.count)
                    }
                }
            }else if selected == 2 {
                DriverView()
                    .environmentObject(orderManager)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
