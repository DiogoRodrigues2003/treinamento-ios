//
//  DogBreedDetails.swift
//  EverythingPets
//
//  Created by Locação on 04/08/22.
//

import Foundation

struct DogBreedDetails: Codable {
    
    let id: Int
    let name: String
    let bredFor: String?
    let breedGroup: String?
    let lifeSpan: String?
    let temperament: String?
    let weight: Measure
    let height: Measure
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case bredFor = "bred_for"
        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
        case temperament
        case weight
        case height
    }
}
