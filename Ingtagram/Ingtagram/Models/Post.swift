//
//  Post.swift
//  Ingtagram
//
//  Created by Barunka Plasovska on 16/06/2023.
//

import Foundation

class Post {
    
    var id: Int
    var imageName: String
    var user: User
    
    init(id: Int, imageName: String, user: User)
    {
        self.id = id
        self.imageName = imageName
        self.user = user
    }
}
