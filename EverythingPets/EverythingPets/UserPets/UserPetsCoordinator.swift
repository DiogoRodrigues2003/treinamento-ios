
import Foundation
import UIKit

class UserPetsCoordinator {
    
    weak private(set) var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

extension UserPetsCoordinator: UserPetsCoordinatorProtocol {
    
    func openPetBreedDetails(using pet: UserPet) {
        let viewController = PetBreedDetailsCoordinator.createModule(using: navigationController, pet: pet)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension UserPetsCoordinator {
    
    class func createModule(using navigationController: UINavigationController?) -> UIViewController {
        let repository = UserPetsRepository()
        
        let coordinator = UserPetsCoordinator(navigationController: navigationController)
        
        let presenter = UserPetsPresenter(repository: repository, coordinator: coordinator)
        
        repository.output = presenter
        
        let viewController = UserPetsViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
}
