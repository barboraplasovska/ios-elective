//
//  DetailView.swift
//  GameCritics
//
//  Created by Barunka Plasovska on 21/06/2023.
//

import Foundation
import SwiftUI

import SwiftUI

struct DetailView: View {
    @State var game: Game
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let smallImageURL = game.smallImageURL {
                AsyncImage(url: URL(string: smallImageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 150, height: 150)
            } else if let bigImageURL = game.bigImageURL {
                AsyncImage(url: URL(string: bigImageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 150, height: 150)
            } else {
                Color.gray
                    .frame(width: 150, height: 150)
            }
            
            Text(game.name ?? "")
                .font(.title)
                .fontWeight(.bold)
            
            Text(game.platform.flatMap { String($0) } ?? "")
            
            Text("Score: \(game.score ?? 0)")
            
            Spacer()
        }
    }
}
