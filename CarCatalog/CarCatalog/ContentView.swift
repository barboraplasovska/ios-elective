//
//  ContentView.swift
//  CarCatalog
//
//  Created by Barunka Plasovska on 24/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var cars: [Car] = []
    
    
    var body: some View {
        VStack {
            HStack {
                Button("Add")
                {
                    for _ in 0...10
                    {
                        cars.append(Car.makeRandomCar())
                    }
                }
                Spacer()
                Button("Clear")
                {
                    cars.removeAll()
                }
            }
            ScrollView {
                VStack {
                    ForEach(cars) { car in
                        Text(car.description)
                    }
                    Spacer()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
