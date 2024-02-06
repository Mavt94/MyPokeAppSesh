//
//  PokemonDetailResponse.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public struct PokemonDetailResponse: Codable {
    public let baseExperience: Int
    public let stats: [StatResponse]
    public let abilities: [Ability]
    public let forms: [Species]
    public let height: Int
    public let id: Int
    public let name: String
    public let order: Int
    public let species: Species
    public let sprites: Sprites
    public let types: [TypeElement]
    public let weight: Int
    
    enum CodingKeys: String, CodingKey {
        case baseExperience = "base_experience"
        case stats = "stats"
        case abilities = "abilities"
        case forms = "forms"
        case height = "height"
        case id = "id"
        case name = "name"
        case order = "order"
        case species = "species"
        case sprites = "sprites"
        case types = "types"
        case weight = "weight"
    }
    
    public init(baseExperience: Int, stats: [StatResponse], abilities: [Ability], forms: [Species], height: Int, id: Int, name: String, order: Int, species: Species, sprites: Sprites, types: [TypeElement], weight: Int) {
        self.baseExperience = baseExperience
        self.stats = stats
        self.abilities = abilities
        self.forms = forms
        self.height = height
        self.id = id
        self.name = name
        self.order = order
        self.species = species
        self.sprites = sprites
        self.types = types
        self.weight = weight
    }
}

// MARK: Data Model Map
extension PokemonDetailResponse {
    func toDataModel() -> PokemonDetailData {
        return PokemonDetailData(baseExperience: baseExperience,
                                 stats: stats.compactMap({ $0.toDataModel() }),
                                 abilities: abilities.compactMap({ $0.toDataModel() }),
                                 forms: forms.compactMap({ $0.toDataModel() }),
                                 height: height,
                                 id: id,
                                 name: name,
                                 order: order,
                                 species: species.toDataModel(),
                                 sprites: sprites.toDataModel(),
                                 types: types.compactMap({ $0.toDataModel() }),
                                 weight: weight)
    }
}

// MARK: Mock
extension PokemonDetailResponse {
    static func mock() -> PokemonDetailResponse {
        return PokemonDetailResponse(
            baseExperience: 100,
            stats: [StatResponse(baseStat: 35, stat: Stat(name: "hp")),
                    StatResponse(baseStat: 35, stat: Stat(name: "defense")),
                    StatResponse(baseStat: 35, stat: Stat(name: "attack")),
                    StatResponse(baseStat: 35, stat: Stat(name: "speed"))],
            abilities: [Ability(ability: Species(name: "static")),
                        Ability(ability: Species(name: "lightning-rod"))],
            forms: [Species(name: "pikachu")],
            height: 10,
            id: 1,
            name: "Pikachu",
            order: 25,
            species: Species(name: "pikachu"),
            sprites: Sprites(backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png",
                               backShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/25.png",
                               frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
                               frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png"),
            types: [TypeElement(type: Species(name: "electric"))],
            weight: 60
        )
    }
}

