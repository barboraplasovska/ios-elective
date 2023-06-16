//
//  User.swift
//  Ingtagram
//
//  Created by Barunka Plasovska on 16/06/2023.
//

import Foundation

class User {
    var username: String
    var profilePictureName: String
    var id: Int
    
    init(id:Int, username: String, profilePictureName: String)
    {
        self.id = id
        self.profilePictureName = profilePictureName
        self.username = username
    }
}
