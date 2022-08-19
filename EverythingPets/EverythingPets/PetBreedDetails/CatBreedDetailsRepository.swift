
import Foundation

class CatBreedDetailsRepository: PetBreedDetailsInputProtocol {
    
    private let api = API()

    weak var output: PetBreedDetailsOutputProtocol?
    
    func getNewPetImage(id: String) {
        api.request(api: .cat, endpoint: .newImage(id: id)) { [weak self] (image: [PetImage]) in
            self?.output?.getNewPetImageSuccess(with: image.first!)
        } failure: { [weak self] error in
            self?.output?.getNewPetImageFailure(with: error)
            print(error)
        }
    }
    
    func getPetBreedDetails(name: String) {
        api.request(api: .cat, endpoint: .breedByName(name: name)) { [weak self] (details: [CatBreedDetails]) in
            self?.output?.getCatBreedDetailsSuccess(with: details.first!)
        } failure: { [weak self] error in
            self?.output?.getPetBreedDetailsFailure(with: error)
            print(error)
        }
    }
}
