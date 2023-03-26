//
//  ContentView.swift
//  Assignment3
//
//  Created by user230914 on 3/25/23.
//

import SwiftUI

struct CountryListView: View {
    @State private var countries: [Country] = []

    var body: some View {
        NavigationView {
            List(countries) { country in
                NavigationLink(destination: CountryDetailView(country: country)) {
                    Text(country.name.common)
                }
            }
            .navigationBarTitle("Countries")
            .onAppear {
                CountryAPI.shared.getCountries { countries in
                    self.countries = countries
                }
            }
        }
    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}

