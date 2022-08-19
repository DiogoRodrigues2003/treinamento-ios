
import Foundation

class DogBreedDetailsRepository: PetBreedDetailsInputProtocol {
    
    private let api = API()

    weak var output: PetBreedDetailsOutputProtocol?
    
    func getNewPetImage(id: String) {
        api.request(api: .dog, endpoint: .newImage(id: id)) { [weak self] (image: [PetImage]) in
            self?.output?.getNewPetImageSuccess(with: image.first!)
        } failure: { [weak self] error in
            self?.output?.getNewPetImageFailure(with: error)
            print(error)
        }
    }
    
    func getPetBreedDetails(name: String) {
        api.request(api: .dog, endpoint: .breedByName(name: name)) { [weak self] (details: [DogBreedDetails]) in
            self?.output?.getDogBreedDetailsSuccess(with: details.first!)
        } failure: { [weak self] error in
            self?.output?.getPetBreedDetailsFailure(with: error)
            print(error)
        }
    }
}
