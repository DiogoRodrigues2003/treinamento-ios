
import Foundation

class DogBreedsRepository: PetBreedsInputProtocol {
    
    private let api = API()

    weak var output: PetBreedsOutputProtocol?
    
    func getPetBreeds(page: Int) {
        api.request(api: .dog, endpoint: .breeds(page: page)) { [weak self] (breeds: [PetBreed]) in
            self?.output?.getPetBreedsSuccess(with: breeds)
        } failure: { [weak self] error in
            self?.output?.getPetBreedsFailure(with: error)
            print(error)
        }
    }
}
