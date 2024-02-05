//
//  StatDTO.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

public struct StatDTO: Codable {
    public let name: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
