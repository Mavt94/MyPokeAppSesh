//
//  PokemonCellViewModel.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 6/2/24.
//

import Foundation
import SwiftData

@MainActor
final class PokemonCellViewModel: ObservableObject {
    
    func deleteItem(context: ModelContext, item: PokemonDetailData) {
        let itemId = Int(item.id)
        try? context.delete(model: PokemonDetailData.self, where: #Predicate { pokemon in
            pokemon.id == itemId
        })
    }
    
    func checkFavorite(dataItems: [PokemonDetailData], id: Int) -> Bool {
        var checked = false
        for dataItem in dataItems {
            if dataItem.id == id {
                checked = true
            }
        }
        return checked
    }
}
