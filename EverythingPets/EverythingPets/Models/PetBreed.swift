
import Foundation

struct PetBreed {
    let id: String
    let name: String
    let image: PetImage?
    let type: PetType
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
    }
}


extension PetBreed: Decodable {
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            id = try values.decode(String.self, forKey: .id)
            type = PetType.cat
        } catch {
            id = try String(values.decode(Int.self, forKey: .id))
            type = PetType.dog
        }
        
        do {
            image = try values.decode(PetImage.self, forKey: .image)
        } catch {
            image = nil
        }
        
        name = try values.decode(String.self, forKey: .name)
    }
}


