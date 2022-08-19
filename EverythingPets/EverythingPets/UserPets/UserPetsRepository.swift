
import Foundation

class UserPetsRepository {

    weak var output: UserPetsOutputProtocol?
}

extension UserPetsRepository: UserPetsInputProtocol {
    
    func getUserPets() {
        output?.getUserPetsSuccess(with: UserPets.shared.pets)
    }
    
    func remove(name: String) {
        UserPets.shared.remove(name: name)
        output?.removeSuccess(with: UserPets.shared.pets)
    }
}
