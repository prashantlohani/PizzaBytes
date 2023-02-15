//
//  DetailView.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 11/02/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cartManager : CartManager
    var pizza: Pizza
    
    @State var sizeSelection: String = "small"
    @State var baseSelection: String = "thin crust"
    @State var toppingSelection: String = "extra cheese"
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .padding(15)
                    .background(Color.clear.cornerRadius(10))
            })
            
            VStack {
                VStack(alignment: .leading) {
                    Text(pizza.name)
                        .bold()
                }
                .padding()
                .frame(width: 350, alignment: .center)
                .font(.title)
                .background(.opacity(0.0))
                .cornerRadius(20)
                
                ZStack(alignment: .bottom) {
                    Image(pizza.image)
                        .resizable()
                        .cornerRadius(20)
                        .frame(width:350)
                        .scaledToFit()
                    
                }
                .frame(width: 350, height: 200)
                .shadow(radius: 3)
                .padding()
                
                
                HStack{
                    Text("Select Size:")
                    Picker(
                        selection: $sizeSelection,
                        label:
                            HStack {
                                Text("Filter:")
                                Text(sizeSelection)
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10),
                        
                        content: {
                            ForEach(pizza.size.keys.sorted(), id: \.self) { key in
                                HStack {
                                    let dict: NSDictionary = pizza.size as NSDictionary
                                    Text(key.capitalized + " $" + String(describing: dict.value(forKey: key) as AnyObject))
                                }
                            }
                            
                        })
                    .pickerStyle(MenuPickerStyle())
                    
                }
                .padding()
                .frame(width: 350, alignment: .leading)
                .background(.opacity(0.1))
                .cornerRadius(20)
                
                HStack{
                    Text("Select Base:")
                    Picker(
                        selection: $baseSelection,
                        label:
                            HStack {
                                Text("Filter:")
                                Text(baseSelection)
                            }
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10),
                        
                        content: {
                            ForEach(base, id: \.self) { option in
                                Text(option.name.capitalized)
                                    .tag(option.name)
                            }
                            
                        })
                }
                .padding()
                .frame(width: 350, alignment: .leading)
                .background(.opacity(0.1))
                .cornerRadius(20)
                
                HStack{
                    Text("Select Topping:")
                    Picker(
                        selection: $toppingSelection,
                        label:
                            HStack {
                                Text("Filter:")
                                Text(toppingSelection)
                            }
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10),
                        
                        content: {
                            ForEach(topping, id: \.self) { option in
                                Text(option.name.capitalized)
                                    .tag(option.name)
                            }
                        })
                    
                }
                .padding()
                .frame(width: 350, alignment: .leading)
                .background(.opacity(0.1))
                .cornerRadius(20)
                
                Button(action: {
                    print("cart button tapped")
                    addPizaToCart()
                }) {
                    Text("Add To Cart")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.red)
                .cornerRadius(20)
                .padding(20)
                
            }
        }
    }
    
    func addPizaToCart() {
        let dict: NSDictionary = pizza.size as NSDictionary
        let selectedPrice = String(describing: dict.value(forKey: sizeSelection) as AnyObject)
        
        let selectedPizza = Pizza(name: pizza.name, image: pizza.image,
                                  size: [sizeSelection: Int(selectedPrice) ?? 0],
                                  base: [Base(name: baseSelection)], topping: [Topping(name: toppingSelection)])
        
        cartManager.addToCart(pizza: selectedPizza)
        presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(pizza: pizzaList[0])
            .environmentObject(CartManager())
    }
}
