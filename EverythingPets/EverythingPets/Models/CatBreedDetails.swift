
import Foundation

struct CatBreedDetails: Codable {
    
    let id: String
    let name: String
    let lifeSpan: String?
    let temperament: String?
    let lap: Int?
    let natural: Int?
    let hairless: Int?
    let weight: Measure
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case lifeSpan = "life_span"
        case temperament
        case lap
        case natural
        case hairless
        case weight
    }
}
