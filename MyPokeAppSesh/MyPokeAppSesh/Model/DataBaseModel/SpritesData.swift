//
//  SpritesData.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 6/2/24.
//

import Foundation
import SwiftData

@Model
public class SpritesData {
    let backDefault: String
    let backShiny: String
    let frontDefault: String
    let frontShiny: String
    
    init(backDefault: String, backShiny: String, frontDefault: String, frontShiny: String) {
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
    }
}

// MARK: Data Model Map
extension SpritesData {
    func toResponseModel() -> Sprites {
        return Sprites(backDefault: backDefault,
                           backShiny: backShiny,
                           frontDefault: frontDefault,
                           frontShiny: frontShiny)
    }
}
