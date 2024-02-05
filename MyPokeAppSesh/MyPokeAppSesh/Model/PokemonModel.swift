//
//  PokemonModel.swift
//
//  Created by Manuel Vera Trinidad on 3/2/24.
//  Archivo creado usando la plantilla SwiftUI por ALTEN http://www.alten.es/
//

import Foundation

final class PokemonModel {
    var list: PokemonListResponse
    var items: [PokemonDetailResponse]
    var nextPage: String

    lazy var rows: [Pokemon] = generateRows()
    
    public init(list: PokemonListResponse, items: [PokemonDetailResponse]) {
        self.list = list
        self.items = items
        nextPage = list.nextPage ?? ""
    }
    
    func addRows(_ newItems: [PokemonDetailResponse]) {
        items.append(contentsOf: newItems)
        rows = generateRows()
    }
    
    func addNewPage(newPage: String) {
        nextPage = newPage
    }

    private func generateRows() -> [Pokemon] {
        return items.map({Pokemon(item: $0)})
    }
}

 extension PokemonModel {
     struct Pokemon {
         let item: PokemonDetailResponse
         
         var id: Int {
             item.id
         }
         
         var baseExperience: String {
             "Base exp - \(item.baseExperience)"
         }
         
         var abilities: [String] {
             item.abilities.map { $0.ability.name.capitalized }
         }
         
         var stats: [String] {
             item.stats.map { "\($0.stat.name.capitalized) - \($0.baseStat)" }
         }
         
         var pokemonNumber: String {
             id < 10 ? "Nº 00\(id)" : (id) < 100 ? "Nº 0\(id)" : "Nº \(id)"
         }
         
         var name: String {
             item.name.capitalized
         }
         
         var image: String {
             item.sprites.frontDefault
         }
         
         var imageShiny: String {
             item.sprites.frontShiny
         }
         
         var types: [String] {
             item.types.compactMap { $0.type.name }
         }
         
         var principalType: String {
             types.first ?? ""
         }
         
         var backgroundColor: String {
             colorForType(item.types.first?.type.name)
         }
         
         func colorForType(_ typeName: String?) -> String {
             switch typeName {
             case "grass": 
                 return "7AC74C"
             case "poison": 
                 return "A33EA1"
             case "fire": 
                 return "EE8130"
             case "flying":
                 return "A98FF3"
             case "water":
                 return "6390F0"
             case "bug":
                 return "A6B91A"
             case "normal":
                 return "A8A77A"
             case "electric":
                 return "F7D02C"
             case "ground":
                 return "E2BF65"
             case "fairy":
                 return "D685AD"
             case "fighting":
                 return "C22E28"
             case "psychic":
                 return "F95587"
             case "rock":
                 return "B6A136"
             case "steel":
                 return "B7B7CE"
             case "ice":
                 return "96D9D6"
             case "ghost":
                 return "735797"
             case "dragon":
                 return "6F35FC"
             default:
                 return ""
             }
         }
         
     }
 }

// MARK: Mock
extension PokemonModel.Pokemon {
    static func mock() -> PokemonModel.Pokemon {
        return PokemonModel.Pokemon(item: PokemonDetailResponse.mock())
    }
}
