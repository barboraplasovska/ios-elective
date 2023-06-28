//
//  DetailView.swift
//  Miam
//
//  Created by Barbora Plasovska on 28/06/2023.
//

import Foundation
import SwiftUI

struct DetailView: View {
    @State var recipe: Recipe
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            // Image
            AsyncImage(url: URL(string: recipe.image ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 250)
            
            ZStack(alignment: .topLeading)
            {
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                
                VStack (alignment: .leading)
                {
                    // Title
                    Text(recipe.label ?? "")
                        .bold()
                        .font(.title)
                    
                    // by whom ?
                    Text("By \(recipe.source ?? "")")
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                    ScrollView {
                        HStack (alignment: .center){
                            VStack {
                                Text("🍴")
                                Text("\(recipe.yield ?? 1)")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(.green)
                            .cornerRadius(20)
                            
                            VStack {
                                Text("👩‍🍳")
                                Text("\(recipe.cuisineType?[0] ?? "")")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(.green)
                            .cornerRadius(20)
                            
                            VStack {
                                Text("🔥")
                                Text("\(Int(recipe.calories ?? 0)) Cal")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(.green)
                            .cornerRadius(20)
                            
                            VStack {
                                Text("⏰")
                                Text("\(Int(recipe.totalTime ?? 0))mn")
                                    .bold()
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(.green)
                            .cornerRadius(20)
                        }
                        
                        // Ingredients
                        Text("Ingredients")
                            .bold()
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        // lines
                        ForEach(recipe.ingredientLines ?? [], id: \.self) { ingredientLine in
                            Text("- \(ingredientLine)")
                                .font(.body)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .padding()
            }
        }
        .ignoresSafeArea()
    }
    
}
