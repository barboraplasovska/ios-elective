//
//  Car.swift
//  CarCatalog
//
//  Created by Barunka Plasovska on 24/05/2023.
//

import Foundation

class Car : ObservableObject, Identifiable {
    var model: String
    var maker: String
    var price: Int
    
    var description: String {
            return "\(model) - \(maker) - \(price)€"
        }
    
    init(model: String, maker: String, price: Int)
    {
        self.maker = maker
        self.model = model
        self.price = price
    }
    
    static func makeRandomCar() -> Car
    {
        let nb = Int.random(in: 1...100)
        let maker = "maker \(nb)"
        
        let model = "model \((nb * 4) / 7)"
        
        let price = Int.random(in: 100...9000)
        
        return Car(model: model, maker: maker, price: price)
    }
    
}
