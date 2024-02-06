//
//  MyPokeAppSeshApp.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 2/2/24.
//

import SwiftUI
import SwiftData

@main
struct MyPokeAppSeshApp: App {

    var body: some Scene {
        WindowGroup {
            TabView {
                PokemonListView()
                    .tabItem {
                        Image(systemName: "menucard")
                        Text("Pokedex")
                    }
                PokemonFavoritesView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Favorites")
                    }
            }
        }
        .modelContainer(for: [PokemonDetailData.self])
    }
}
