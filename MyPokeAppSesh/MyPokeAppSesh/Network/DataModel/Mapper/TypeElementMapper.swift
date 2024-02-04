//
//  TypeElementMapper.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 4/2/24.
//

import Foundation

extension TypeElementDTO {
    public func toBO() -> TypeElementBO? {
        return TypeElementBO(dto: self)
    }
}

extension TypeElementBO {
    init?(dto item: TypeElementDTO) {
        guard let type = item.type?.toBO() else { return nil }
        self.init(type: type)
    }
}
