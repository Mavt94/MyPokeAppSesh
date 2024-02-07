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
            PokemonListView()
        }
        .modelContainer(for: [PokemonDetailData.self])
    }
}
