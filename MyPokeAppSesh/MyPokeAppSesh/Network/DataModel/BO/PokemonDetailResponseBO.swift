//
//  PokemonDetailResponseBO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public struct PokemonDetailResponseBO {
    public let baseExperience: Int
    public let forms: [SpeciesBO]
    public let height: Int
    public let id: Int
    public let name: String
    public let order: Int
    public let species: SpeciesBO
    public let sprites: SpritesBO
    public let types: [TypeElementBO]
    public let weight: Int
    
    public init(baseExperience: Int, forms: [SpeciesBO], height: Int, id: Int, name: String, order: Int, species: SpeciesBO, sprites: SpritesBO, types: [TypeElementBO], weight: Int) {
        self.baseExperience = baseExperience
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
