//
//  TypeElementData.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 6/2/24.
//

import Foundation
import SwiftData

@Model
public class TypeElementData {
    let type: SpeciesData

    init(type: SpeciesData) {
        self.type = type
    }
}

extension TypeElementData {
    func toResponseModel() -> TypeElement {
        return TypeElement(type: type.toResponseModel())
    }
}
