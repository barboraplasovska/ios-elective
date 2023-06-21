//
//  ViewModel.swift
//  GameCritics
//
//  Created by Barunka Plasovska on 21/06/2023.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject, Identifiable {
    @Published var games : [Game]
    
    init() {
        self.games = []
    }
    
    func download(url: String) async throws -> (Data, URLResponse)? {
        do {
            return try await URLSession.shared.data(from: URL(string: url)!)
        } catch { print(error.localizedDescription)
            return nil
        }
        
    }
    
    @MainActor
    func getGames() async {
        do {
            if let (gameData, _) = try await self.download(url: "https://education.3ie.fr/ios/StarterKit/GameCritic/GameCritics.json") {
                let decoder = JSONDecoder()
                do {
                    self.games = try decoder.decode([Game].self, from: gameData)
                } catch {
                    print("Failed to parse data")
                }
        }
            } catch {
            print("Failed to get games data")
        }
    }
}
