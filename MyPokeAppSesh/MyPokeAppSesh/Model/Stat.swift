//
//  Stat.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

public struct Stat: Codable {
    public let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }

    public init(name: String) {
        self.name = name
    }
}

// MARK: Data Model Map
extension Stat {
    func toDataModel() -> StatData {
        return StatData(name: name)
    }
}
