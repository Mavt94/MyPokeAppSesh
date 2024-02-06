//
//  PokemonDetailData.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 6/2/24.
//

import Foundation
import SwiftData

@Model
final class PokemonDetailData: Identifiable {
    let baseExperience: Int
    let stats: [StatResponseData]
    let abilities: [AbilityData]
    let forms: [SpeciesData]
    let height: Int
    @Attribute(.unique) let id: Int
    let name: String
    let order: Int
    let species: SpeciesData
    let sprites: SpritesData
    let types: [TypeElementData]
    let weight: Int
    
    init(baseExperience: Int, stats: [StatResponseData], abilities: [AbilityData], forms: [SpeciesData], height: Int, id: Int, name: String, order: Int, species: SpeciesData, sprites: SpritesData, types: [TypeElementData], weight: Int) {
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
