//
//  CharacterDetailView.swift
//  Assignment3
//
//  Created by user230914 on 3/25/23.

import SwiftUI

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                AsyncImage(url: URL(string: character.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
                .cornerRadius(8)
                .padding(.top)
                .scaledToFit()
                
                Text(character.name)
                    .font(.largeTitle)
                    .bold()

                Text("Status: \(character.status)")
                    .font(.headline)
                Text("Species: \(character.species)")
                    .font(.headline)

                Spacer()
            }
            .padding()
            .navigationBarTitle(character.name, displayMode: .inline)
        }
    }
}

