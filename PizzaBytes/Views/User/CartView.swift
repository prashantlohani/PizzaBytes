//
//  CartView.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 11/02/23.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cartManager : CartManager
    
    @State var userName: String = ""
    @State var userPhone: String = ""
    @State var userAddress: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        
        ScrollView {
            ForEach(cartManager.pizzas, id: \.id) {
                pizza in
                ProductRow(pizza: pizza)
            }
            
            HStack {
                Text("Your cart total is")
                Spacer()
                Text("$\(cartManager.total).00")
                    .bold()
            }
            .padding()
            VStack {
                TextField("Full Name", text: $userName)
                    .font(.headline)
                    .padding()
                    .cornerRadius(10)
                    .foregroundColor(Color.accentColor)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityIdentifier("nameField")
                    .keyboardType(.alphabet)
                    .textContentType(.oneTimeCode)
                    .autocorrectionDisabled(true)
                
                TextField("Enter Phone number", text: $userPhone)
                    .font(.headline)
                    .padding()
                    .cornerRadius(10)
                    .foregroundColor(Color.accentColor)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityIdentifier("phoneField")
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .autocorrectionDisabled(true)
                
                TextField("Enter complete address", text: $userAddress)
                    .font(.headline)
                    .padding()
                    .cornerRadius(10)
                    .foregroundColor(Color.accentColor)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityIdentifier("addressField")
                    .keyboardType(.alphabet)
                    .textContentType(.oneTimeCode)
                    .autocorrectionDisabled(true)
                    
            }
            
            Button(action: {
                print("place order button tapped")
                let orderDetail = [Order(userName: userName, userAddress: userAddress, userPhone: userPhone, isDelivered: false, orderDetail: cartManager.pizzas)]
                
                checkoutButtonPressed(orderDetail: orderDetail)
                
            }) {
                Text("Place Order")
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
        .navigationTitle(Text("My Cart"))
        .alert(isPresented: $showAlert, content: getAlert)
        .padding(.top)
    }
    
    func checkoutButtonPressed(orderDetail: [Order]) {
        if textIsAppropriate(name: userName, phone: userPhone, address: userAddress) {
            if isValidPhone(phone: userPhone) {
                cartManager.placeOrder(orderDetail: orderDetail)
                presentationMode.wrappedValue.dismiss()
                cartManager.removeAllFromCart()
            }else{
                alertTitle = "Invalid phone number!"
                showAlert.toggle()
            }
        }
    }
    func textIsAppropriate(name: String, phone: String, address: String) -> Bool {
        if name.isEmpty || phone.isEmpty || address.isEmpty {
            alertTitle = "All fields are required!"
            showAlert.toggle()
            return false
        }
        return true
    }
    func isValidPhone(phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
