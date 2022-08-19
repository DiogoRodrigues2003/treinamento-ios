
import Foundation
import UIKit

class PetBreedDetailsCoordinator {
    
    weak private(set) var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

extension PetBreedDetailsCoordinator: PetBreedDetailsCoordinatorProtocol {
    
    func openPetRegistration(breedName: String, breedId: String, petType: PetType) {
        let viewController = AddPetCoordinator.createModule(using: navigationController, breedName: breedName, breedId: breedId, petType: petType)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension PetBreedDetailsCoordinator {
    
    class func createModule(using navigationController: UINavigationController?, breed: PetBreed) -> UIViewController {
        
        let repository: PetBreedDetailsInputProtocol = breed.type == PetType.cat ? CatBreedDetailsRepository() : DogBreedDetailsRepository()

        let coordinator = PetBreedDetailsCoordinator(navigationController: navigationController)
        
        let presenter = PetBreedDetailsPresenter(repository: repository, coordinator: coordinator, breedName: breed.name, breedId: breed.id, petType: breed.type)
        
        repository.output = presenter
        
        let viewController = PetBreedDetailsViewController(presenter: presenter, petType: breed.type)
        presenter.view = viewController
        
        return viewController
    }
    
    class func createModule(using navigationController: UINavigationController?, pet: UserPet) -> UIViewController {
        
        let repository: PetBreedDetailsInputProtocol = pet.type == PetType.cat ? CatBreedDetailsRepository() : DogBreedDetailsRepository()

        let coordinator = PetBreedDetailsCoordinator(navigationController: navigationController)
        
        let presenter = PetBreedDetailsPresenter(repository: repository, coordinator: coordinator, breedName: pet.breedName, breedId: pet.breedId, petType: pet.type)
        
        repository.output = presenter
        
        let viewController = PetBreedDetailsViewController(presenter: presenter, petType: pet.type)
        presenter.view = viewController
        
        return viewController
    }
}
