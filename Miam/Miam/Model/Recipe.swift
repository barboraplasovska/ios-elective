//
//  Recipe.swift
//  Miam
//
//  Created by Barbora Plasovska on 28/06/2023.
//

import Foundation
import SwiftUI

class Recipe : Codable
{
    let label: String?
    let image: String?
    let source: String?
    let calories: Double?
    let yield: Int?
    let cuisineType: [String]?
    let totalTime: Double?
    let ingredientLines: [String]?
    
    init(label: String?, image: String?, source: String?, calories: Double?, yield: Int?, cuisineType: [String]?, totalTime: Double?, ingredientLines: [String]?) {
        self.label = label
        self.image = image
        self.source = source
        self.calories = calories
        self.yield = yield
        self.cuisineType = cuisineType
        self.totalTime = totalTime
        self.ingredientLines = ingredientLines
    }
}
