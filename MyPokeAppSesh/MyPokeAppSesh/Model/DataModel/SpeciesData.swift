//
//  SpeciesData.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 6/2/24.
//

import Foundation
import SwiftData

@Model
public class SpeciesData {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
