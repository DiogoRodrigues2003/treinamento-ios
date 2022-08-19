
import Foundation
import UIKit

class PetBreedDetailsPresenter: NSObject {

    weak var view: PetBreedDetailsViewProtocol?
    var repository: PetBreedDetailsInputProtocol
    var coordinator: PetBreedDetailsCoordinatorProtocol
    
    private let breedName: String
    private let breedId: String
    private let petType: PetType
    
    init(repository: PetBreedDetailsInputProtocol,
                  coordinator: PetBreedDetailsCoordinatorProtocol,
                  breedName: String,
                  breedId: String,
                  petType: PetType) {
        self.repository = repository
        self.coordinator = coordinator
        self.breedName = breedName
        self.breedId = breedId
        self.petType = petType
    }
}

// MARK: - Presenter Protocol
extension PetBreedDetailsPresenter: PetBreedDetailsPresenterProtocol {
    
    func viewDidLoad() {
        view?.showLoadingIndicator()

        repository.getNewPetImage(id: breedId)
        repository.getPetBreedDetails(name: breedName)
    }
    
    func getNewPetImage() {
        view?.showLoadingIndicator()
        
        repository.getNewPetImage(id: breedId)
    }
    
    func addPet() {
        coordinator.openPetRegistration(breedName: breedName, breedId: breedId, petType: petType)
    }
}

// MARK: - Repository Output
extension PetBreedDetailsPresenter: PetBreedDetailsOutputProtocol {
    
    func getDogBreedDetailsSuccess(with details: DogBreedDetails) {
        DispatchQueue.main.async {
            self.view?.hideLoadingIndicator()
            self.view?.setupDog(with: details)
        }
    }
    
    func getCatBreedDetailsSuccess(with details: CatBreedDetails) {
        DispatchQueue.main.async {
            self.view?.hideLoadingIndicator()
            self.view?.setupCat(with: details)
        }
    }
    
    func getPetBreedDetailsFailure(with error: APIError) {
        DispatchQueue.main.async {
            self.view?.showAlert(title: "Error", message: "A error on the API has ocurred")
        }
    }
    
    func getNewPetImageSuccess(with image: PetImage) {
        DispatchQueue.main.async {
            self.view?.hideLoadingIndicator()
            self.view?.setupImage(image: image)
        }
    }
    
    func getNewPetImageFailure(with error: APIError) {
        DispatchQueue.main.async {
            self.view?.showAlert(title: "Error", message: "A error on the API has ocurred")
        }
    }
}
