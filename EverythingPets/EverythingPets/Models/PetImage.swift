
import Foundation

struct PetImage: Codable {
    let id: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
    }
}
