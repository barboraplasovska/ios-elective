//
//  Game.swift
//  GameCritics
//
//  Created by Barunka Plasovska on 21/06/2023.
//

import Foundation

class Game : Codable {
    var id: Int?
    var name: String?
    var smallImageURL: String?
    var bigImageURL: String?
    var score: Int?
    var platform: String?
    
    init(id: Int?, name: String?, smallImageURL: String?, bigImageURL: String?, score: Int?, platform: String?) {
        self.id = id
        self.name = name
        self.smallImageURL = smallImageURL
        self.bigImageURL = bigImageURL
        self.score = score
        self.platform = platform
    }
}
