//
//  AbilityData.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 6/2/24.
//

import Foundation
import SwiftData

@Model
public class AbilityData {
    let ability: SpeciesData
    
    init(ability: SpeciesData) {
        self.ability = ability
    }
}
