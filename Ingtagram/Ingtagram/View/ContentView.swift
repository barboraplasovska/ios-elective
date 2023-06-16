//
//  ContentView.swift
//  Ingtagram
//
//  Created by Barunka Plasovska on 16/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            NavigationStack
            {
                
                List(viewModel.posts, id: \.id) { post in
                    VStack(alignment: .leading,
                           spacing: 10)
                    {
                            NavigationLink(
                                destination: DetailView(user: post.user, viewModel: viewModel)
                            )
                            {
                                HStack {
                                    Image(post.user.profilePictureName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                    Text(post.user.username)
                                        .font(.headline)
                            }
                        }
                        Image(post.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(15)
                    }
                }
                .navigationTitle("Ingtagram")
                .listRowSeparator(.hidden)
                .listStyle(PlainListStyle())
            }
            .onAppear {
                Task {
                    await viewModel.getData()
                }
            }
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
