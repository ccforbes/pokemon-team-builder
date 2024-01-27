//
//  Move.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 1/26/24.
//

import Foundation

enum DamageClass: Codable {
    case physical, special, status
}

struct Move: Codable {
    let name: String
    let description: Int
    let type: PokemonType
    let pp: Int
    let power: Int
    let accuracy: Int
    let damageClass: DamageClass
}
