//
//  CharacterListView.swift
//  Assignment3
//
//  Created by user230914 on 3/25/23.
//
import SwiftUI

struct CharacterListView: View {
    @StateObject var characterViewModel = CharacterViewModel()
    var body: some View {
        NavigationView {
            List(characterViewModel.characters) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    HStack {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                        
                        VStack(alignment: .leading) {
                            Text(character.name)
                                .font(.headline)
                            Text(character.species)
                                .font(.subheadline)
                                    .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationBarTitle("Rick and Morty Wiki")
            .onAppear {
                characterViewModel.fetchCharacters()
            }
        }
    }
}
struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}

