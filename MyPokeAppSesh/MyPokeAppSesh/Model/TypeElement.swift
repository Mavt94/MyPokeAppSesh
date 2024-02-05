//
//  TypeElement.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

public struct TypeElement: Codable {
    public let type: Species
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
    }

    public init(type: Species) {
        self.type = type
    }
}
