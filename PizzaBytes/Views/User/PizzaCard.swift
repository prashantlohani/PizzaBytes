//
//  PizzaCard.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 11/02/23.
//

import SwiftUI

struct PizzaCard: View {
    @State var showSheet: Bool = false
    @EnvironmentObject var cartManager : CartManager
    var pizza: Pizza
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(pizza.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width:350)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(pizza.name)
                        .bold()
                }
                .padding()
                .foregroundColor(.white)
                .frame(width: 350, alignment: .leading)
                .background(.opacity(0.3))
                .cornerRadius(20)
            }
            .frame(width: 350, height: 200)
            .shadow(radius: 3)
            
            Button{
                showSheet.toggle()
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
            .sheet(isPresented: $showSheet, content: {
                DetailView(pizza: pizza)
            })
        }
    }
}


struct PizzaCard_Previews: PreviewProvider {
    static var previews: some View {
        PizzaCard(pizza: pizzaList[0])
            .environmentObject(CartManager())
    }
}
