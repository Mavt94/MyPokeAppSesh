//
//  SpritesBO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public class SpritesBO {
    public let backDefault: String
    public let backShiny: String
    public let frontDefault: String
    public let frontShiny: String
    
    public init(backDefault: String, backShiny: String, frontDefault: String, frontShiny: String) {
        self.backDefault = backDefault
        self.backShiny = backShiny
        self.frontDefault = frontDefault
        self.frontShiny = frontShiny
    }
}
