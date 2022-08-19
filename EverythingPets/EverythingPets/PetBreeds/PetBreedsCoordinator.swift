
import Foundation
import UIKit

class PetBreedsCoordinator {
    
    weak private(set) var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

extension PetBreedsCoordinator: PetBreedsCoordinatorProtocol {
    
    func openPetDetails(using breed: PetBreed) {
        let viewController = PetBreedDetailsCoordinator.createModule(using: navigationController, breed: breed)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension PetBreedsCoordinator {
    
    class func createModule(using navigationController: UINavigationController?, type: PetType) -> UIViewController {
        let repository: PetBreedsInputProtocol = type == PetType.cat ? CatBreedsRepository() : DogBreedsRepository()

        let coordinator = PetBreedsCoordinator(navigationController: navigationController)
        
        let presenter = PetBreedsPresenter(repository: repository, coordinator: coordinator)
        
        repository.output = presenter
        
        let viewController = PetBreedsViewController(presenter: presenter, petType: type)
        presenter.view = viewController
        
        return viewController
    }
}
