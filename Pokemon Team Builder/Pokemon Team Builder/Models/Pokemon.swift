//
//  Pokemon.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 1/26/24.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let nickname: String
    let primaryType: PokemonType
    let secondaryType: PokemonType?
    let ability: String
    let nature: String
    let item: String
    let moves: [Move]
}
