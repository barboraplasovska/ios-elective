//
//  ViewModel.swift
//  Ingtagram
//
//  Created by Barunka Plasovska on 16/06/2023.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject, Identifiable
{
    @Published var posts = [Post]()
    @Published var users = [User]()
    
    func generateRandomUsers() async
    {
            for index in 1...10 {
                let user = User(id: index, username: "John Doe \(index)", profilePictureName: "pp\(index)")
                users.append(user)
            }
    }
        
    
    func generateRandomPosts() async
    {
        for index in 1...20 {
            guard let randomUser = users.randomElement() else {
                continue // Skip if no users are available
            }
            
            let post = Post(id: index, imageName: "img\(index)", user: randomUser)
            posts.append(post)
        }
    }
    
    func getData() async
    {
        await generateRandomUsers();
        await generateRandomPosts();
    }
}
