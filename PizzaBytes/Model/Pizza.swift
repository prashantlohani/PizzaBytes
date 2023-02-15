//
//  Pizza.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 11/02/23.
//

import Foundation

struct Pizza : Codable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var image: String
    var size: [String:Int]
    var base: [Base]
    var topping: [Topping]
}

struct Base : Codable, Hashable {
    let name: String
}

struct Topping : Codable, Hashable {
    let name: String
}

let base: [Base] = [
    Base(name: "thin crust"),
    Base(name: "cheese burst"),
    Base(name: "fresh pan")
]

let topping: [Topping] = [
    Topping(name: "extra cheese"),
    Topping(name: "pineapples"),
    Topping(name: "sweet corn")
]


var pizzaList = [Pizza(name: "Big Hawaiian", image: "big hawaiian",
                       size: ["small":8,"medium":10,"large":12], base: base, topping: topping),
                 
                 Pizza(name: "Buffalo Chicken", image: "buffalo chicken",
                       size: ["small":9,"medium":11,"large":13], base: base, topping: topping),
                 
                 Pizza(name: "Hawaiian", image: "hawaiian",
                       size: ["small":10,"medium":12,"large":14], base: base, topping: topping),
                 
                 Pizza(name: "Pepperoni", image: "pepperoni",
                       size: ["small":10,"medium":12,"large":14], base: base, topping: topping),
                 
                 Pizza(name: "Simply Cheese", image: "simply cheese",
                       size: ["small":7,"medium":8,"large":9], base: base, topping: topping),
                 
                 Pizza(name: "Vegorama", image: "vegorama",
                       size: ["small":8,"medium":9,"large":10], base: base, topping: topping),
                 
]


