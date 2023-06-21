//
//  ContentView.swift
//  GameCritics
//
//  Created by Barunka Plasovska on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var searchedText = ""
    
    var body: some View {
        NavigationStack {
            List(viewModel.games.filter { searchedText.isEmpty || ($0.name?.contains(searchedText) ?? false) }, id: \.id) { game in
                NavigationLink(destination: DetailView(game: game, viewModel: viewModel))
                {
                    
                    HStack {
                        if let bigImageURL = game.bigImageURL {
                            AsyncImage(url: URL(string: bigImageURL)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 150, height: 150)
                        } else if let smallImageURL = game.smallImageURL {
                            AsyncImage(url: URL(string: smallImageURL)) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 150, height: 150)
                        } else {
                            Color.gray
                                .frame(width: 50, height: 50)
                        }
                        
                        VStack {
                            Text(game.name ?? "")
                                .fontWeight(.bold)
                            Text(game.platform.flatMap { String($0) } ?? "")
                            Spacer()
                            Text("Score: \(game.score ?? 0)")
                        }
                        
                    }
                }
                
            }
            .task {
                await viewModel.getGames()
            }
            .searchable(text: $searchedText, prompt: "Search")
            .navigationTitle("Game Critics")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
