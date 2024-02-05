//
//  StatMapper.swift
//  MyPokeAppSesh
//
//  Created by Manuel Vera Trinidad on 5/2/24.
//

import Foundation

extension StatDTO {
    public func toBO() -> StatBO? {
        return StatBO(dto: self)
    }
}

extension StatBO {
    init?(dto item: StatDTO) {
        guard let name = item.name else { return nil }
        self.init(name: name)
    }
}
