
import Foundation

protocol UserPetProtocol: Codable {
    var name: String { get }
    var breedName: String { get }
    var breedId: String { get }
    var imageName: String? { get }
    var type: PetType { get }
}

struct UserPet: UserPetProtocol, Equatable {
    let name: String
    let breedName: String
    let breedId: String
    let imageName: String?
    let type: PetType
    
    init(name: String, breedName: String, breedId: String, imageName: String?, type: PetType) {
        self.name = name
        self.breedName = breedName
        self.breedId = breedId
        self.imageName = imageName
        self.type = type
    }
}


