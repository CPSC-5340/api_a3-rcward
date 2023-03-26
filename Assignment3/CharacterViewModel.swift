//
//  CharacterViewModel.swift
//  Assignment3
//
//  Created by user230914 on 3/25/23.
//
import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    
    func fetchCharacters() {
        let url = "https://rickandmortyapi.com/api/character"

        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            guard let data = data else { return }
            do {
                let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                DispatchQueue.main.async {
                    self.characters = characterResponse.results
                }
            } catch {
                print("Error with JSON: \(error)")
            }
        }.resume()
    }
}



