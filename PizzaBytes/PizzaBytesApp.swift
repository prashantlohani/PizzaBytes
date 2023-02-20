//
//  PizzaBytesApp.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 15/02/23.
//

import SwiftUI

@main
struct PizzaBytesApp: App {
    
    @StateObject var cartManager: CartManager = CartManager()
    
    init() {
        ServerConfig.shared.setUpServerConfig()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                UserView()
            }
            .environmentObject(cartManager)
        }
    }
}
