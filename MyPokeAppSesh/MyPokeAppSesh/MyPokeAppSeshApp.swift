//
//  MyPokeAppSeshApp.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 2/2/24.
//

import SwiftUI

@main
struct MyPokeAppSeshApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            PokemonListView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
