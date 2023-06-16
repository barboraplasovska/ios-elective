//
//  DetailView.swift
//  Ingtagram
//
//  Created by Barunka Plasovska on 16/06/2023.
//

import Foundation

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var user: User
    @State private var viewModel = ViewModel()
    
    init(user: User, viewModel: ViewModel) {
        _user = State(initialValue: user)
        _viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            
            Image(user.profilePictureName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
            
            Text(user.username)
                .font(.title)
                .fontWeight(.bold)
            
            Text(numberOfPosts())
                .font(.headline)
            
            Spacer()
        }
        //.navigationTitle("")
        /*.navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    //Image(systemName: "chevron.left")
                    //Text("Ingtagram")
                })*/
    }
    
    func numberOfPosts() -> String {
        let filteredPosts = viewModel.posts.filter { $0.user.id == user.id }
        let posts = filteredPosts.count > 1 || filteredPosts.isEmpty ? "posts" : "post";
        return "\(filteredPosts.count) \(posts)"
    }
}
