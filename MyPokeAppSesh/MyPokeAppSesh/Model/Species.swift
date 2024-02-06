//
//  Species.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public struct Species: Codable {
    public let name: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    
    public init(name: String) {
        self.name = name
    }
}

// MARK: Data Model Map
extension Species {
    func toDataModel() -> SpeciesData {
        return SpeciesData(name: name)
    }
}
