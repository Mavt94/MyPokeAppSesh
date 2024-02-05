//
//  PokemonDetailResponseBO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public struct PokemonDetailResponseBO {
    public let baseExperience: Int
    public let stats: [StatResponseBO]
    public let abilities: [AbilityBO]
    public let forms: [SpeciesBO]
    public let height: Int
    public let id: Int
    public let name: String
    public let order: Int
    public let species: SpeciesBO
    public let sprites: SpritesBO
    public let types: [TypeElementBO]
    public let weight: Int
    
    public init(baseExperience: Int, stats: [StatResponseBO], abilities: [AbilityBO], forms: [SpeciesBO], height: Int, id: Int, name: String, order: Int, species: SpeciesBO, sprites: SpritesBO, types: [TypeElementBO], weight: Int) {
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

// MARK: Mock
extension PokemonDetailResponseBO {
    static func mock() -> PokemonDetailResponseBO {
        return PokemonDetailResponseBO(
            baseExperience: 100,
            stats: [StatResponseBO(baseStat: 35, stat: StatBO(name: "hp")),
                    StatResponseBO(baseStat: 35, stat: StatBO(name: "defense")),
                    StatResponseBO(baseStat: 35, stat: StatBO(name: "attack")),
                    StatResponseBO(baseStat: 35, stat: StatBO(name: "speed"))],
            abilities: [AbilityBO(ability: SpeciesBO(name: "static")),
                        AbilityBO(ability: SpeciesBO(name: "lightning-rod"))],
            forms: [SpeciesBO(name: "pikachu")],
            height: 10,
            id: 1,
            name: "Pikachu",
            order: 25,
            species: SpeciesBO(name: "pikachu"),
            sprites: SpritesBO(backDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/25.png",
                               backShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/25.png",
                               frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png",
                               frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/25.png"),
            types: [TypeElementBO(type: SpeciesBO(name: "electric"))],
            weight: 60
        )
    }
}

