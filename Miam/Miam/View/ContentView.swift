//
//  ContentView.swift
//  Miam
//
//  Created by Barbora Plasovska on 28/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var searchedText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search for recipe",
                          text: $searchedText)
                .textFieldStyle(.roundedBorder)
                
                NavigationLink(destination:
                RecipesView(searchedText: searchedText))
                {
                    Text("Search")
                }.buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Search")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
