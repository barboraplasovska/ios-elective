//
//  Hit.swift
//  Miam
//
//  Created by Barbora Plasovska on 28/06/2023.
//

import Foundation

class Hit: Codable
{
    let recipe: Recipe?
    
    init(recipe: Recipe?) {
        self.recipe = recipe
    }
}
