//
//  ViewModel.swift
//  Miam
//
//  Created by Barbora Plasovska on 28/06/2023.
//

import Foundation

class ViewModel : ObservableObject, Identifiable
{
    @Published var recipes : [Recipe]
    
    init()
    {
        self.recipes = []
    }
    
    
    func download(url: String) async throws -> (Data, URLResponse)? {
        do {
            return try await URLSession.shared.data(from: URL(string: url)!)
        } catch { print(error.localizedDescription)
            return nil
        }
        
    }
    
    @MainActor
    func getRecipes(recipe: String) async {
        do {
            if let (data, _) = try await self.download(url: "https://api.edamam.com/api/recipes/v2?type=public&q=\(recipe)&app_id=74995dd2&app_key=0216c6c013502175843e8e3d1901dfc7") {
                let decoder = JSONDecoder()
                do {
                    let response : Response = try decoder.decode(Response.self, from: data)
                    if let hits = response.hits {
                        for hit in hits {
                            if let recipe = hit.recipe{
                                self.recipes.append(recipe)
                            }
                        }
                    }
                    
                } catch {
                    print("Failed to parse data")
                }
        }
            } catch {
            print("Failed to get games recipes")
        }
    }
}
