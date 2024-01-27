//
//  PokemonType.swift
//  Pokemon Team Builder
//
//  Created by Chris Forbes on 1/26/24.
//

import Foundation

enum PokemonType: Codable {
    case normal
    case fire
    case water
    case electric
    case grass
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dragon
    case dark
    case steel
    case fairy
}

// Purely defensive for now :)
final class PokemonTypeChart {
    static let weaknesses: [PokemonType: [PokemonType]] = [
        .normal: [.fighting],
        .fire: [.water, .ground, .rock],
        .water: [.electric, .grass],
        .electric: [.ground],
        .grass: [.fire, .ice, .poison, .flying],
        .ice: [.fire, .fighting, .rock, .steel],
        .fighting: [.flying, .psychic, .fairy],
        .poison: [.ground, .psychic],
        .ground: [.water, .grass, .ice],
        .flying: [.electric, .ice, .rock],
        .psychic: [.bug, .flying],
        .bug: [.fire, .flying, .rock],
        .rock: [.water, .grass, .fighting, .ground, .steel],
        .ghost: [.ghost, .dark],
        .dragon: [.ice, .dragon, .fairy],
        .dark: [.fighting, .bug, .fairy],
        .steel: [.fire, .fighting, .ground],
        .fairy: [.poison, .steel]
    ]
    
    static let resistances: [PokemonType: [PokemonType]] = [
        .normal: [],
        .fire: [.fire, .grass, .ice, .bug, .steel, .fairy],
        .water: [.fire, .water, .ice, .steel],
        .electric: [.electric, .flying, .steel],
        .grass: [.water, .electric, .grass, .ground],
        .ice: [.ice],
        .fighting: [.bug, .rock, .dark],
        .poison: [.grass, .fighting, .poison, .bug, .fairy],
        .ground: [.poison, .rock],
        .flying: [.grass, .fighting, .bug],
        .psychic: [.fighting, .psychic],
        .bug: [.grass, .fighting, .ground],
        .rock: [.normal, .fire, .poison, .flying, .steel],
        .ghost: [.poison, .bug],
        .dragon: [.fire, .water, .electric, .grass],
        .dark: [.ghost, .dark],
        .steel: [.normal, .grass, .ice, .flying, .psychic, .bug, .rock, .dragon, .steel, .fairy],
        .fairy: [.fighting, .bug, .dark]
    ]
    
    static let immunities: [PokemonType: [PokemonType]] = [
        .normal: [.ghost],
        .fire: [],
        .water: [],
        .electric: [],
        .grass: [],
        .ice: [],
        .fighting: [],
        .poison: [],
        .ground: [],
        .flying: [],
        .psychic: [],
        .bug: [],
        .rock: [],
        .ghost: [.normal, .fighting],
        .dragon: [],
        .dark: [.psychic],
        .steel: [.poison],
        .fairy: [.dragon]
    ]
}
