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
        
        disableHardwareKeyboard()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                UserView()
            }
            .environmentObject(cartManager)
        }
    }
    
    func disableHardwareKeyboard() {
        #if targetEnvironment(simulator)
        // Disable hardware keyboards.
        let setHardwareLayout = NSSelectorFromString("setHardwareLayout:")
        UITextInputMode.activeInputModes
            // Filter `UIKeyboardInputMode`s.
            .filter({ $0.responds(to: setHardwareLayout) })
            .forEach { $0.perform(setHardwareLayout, with: nil) }
        #endif
    }
}
