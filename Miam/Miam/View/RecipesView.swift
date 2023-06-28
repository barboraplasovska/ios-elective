//
//  RecipesView.swift
//  Miam
//
//  Created by Barbora Plasovska on 28/06/2023.
//

import Foundation
import SwiftUI

struct RecipesView: View {
    @State var searchedText = ""
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationStack
        {
            List(viewModel.recipes.filter { searchedText.isEmpty || ($0.label?.contains(searchedText) ?? false) }, id: \.label) {
                
                recipe in NavigationLink(destination: DetailView(recipe: recipe, viewModel: viewModel))
                {
                        HStack {
                            AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(10)
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)

                            VStack (alignment: .leading) {
                                Text(recipe.label ?? "")
                                    .fontWeight(.bold)
                                Text("Servings: \(recipe.yield ?? 1) people")
                                Spacer()
                                Text("\(Int(recipe.calories ?? 0)) Cal")
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.green)
                                    .cornerRadius(15)
                            }
                        }
                    }
                }
                .task {
                    await viewModel.getRecipes(recipe: searchedText)
                }
                .navigationTitle("Recipes")
                .listStyle(.plain)
        }
    }
}
