
import Foundation
import UIKit

class AddPetPresenter {
    
    weak var view: AddPetViewProtocol?
    let coordinator: AddPetCoordinatorProtocol
    
    private let breedName: String
    private let breedId: String
    private let petType: PetType
    
    init(coordinator: AddPetCoordinatorProtocol, breedName: String, breedId: String, petType: PetType) {
        self.coordinator = coordinator
        self.breedName = breedName
        self.breedId = breedId
        self.petType = petType
    }
}

// MARK: - Presenter Protocol
extension AddPetPresenter: AddPetPresenterProtocol {
    
    func submitPet(name: String?, image: UIImage?, imageName: String) {
        guard name != nil && !name!.isEmpty else {
            DispatchQueue.main.async {
                self.view?.showAlert(title: "Error", message: "The name of your pet is missing.")
            }
            return
        }
        
        guard image != nil else {
            DispatchQueue.main.async {
                self.view?.showAlert(title: "Error", message: "A image of your pet is missing.")
            }
            return
        }
        
        if UserPets.shared.checkPet(name: name!) == true {
            let savedImage = saveImage(name: name!, image: image!, imageName: imageName)
            UserPets.shared.toggle(name: name!, breedName: breedName, breedId: breedId, imageName: savedImage, type: petType)
            
            coordinator.openUserPets()
        } else {
            DispatchQueue.main.async {
                self.view?.showAlert(title: "Error", message: "You have already submitted this pet before.")
            }
        }
    }
}
