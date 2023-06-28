//
//  Response.swift
//  Miam
//
//  Created by Barbora Plasovska on 28/06/2023.
//

import Foundation

class Response: Codable {
    let hits: [Hit]?
    
    init(hits: [Hit]?) {
            self.hits = hits
    }
}
