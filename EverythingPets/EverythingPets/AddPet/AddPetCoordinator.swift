
import Foundation
import UIKit

class AddPetCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

extension AddPetCoordinator: AddPetCoordinatorProtocol {
    
    func openUserPets() {
        navigationController?.tabBarController?.selectedIndex = 1
        navigationController?.popToRootViewController(animated: true)
    }
}

extension AddPetCoordinator {
    
    class func createModule(using navigationController: UINavigationController?, breedName: String, breedId: String, petType: PetType) -> UIViewController {
        
        let coordinator = AddPetCoordinator(navigationController: navigationController)
        let presenter = AddPetPresenter(coordinator: coordinator, breedName: breedName, breedId: breedId, petType: petType)
        let view = AddPetViewController(presenter: presenter, breedName: breedName)

        presenter.view = view

        return view
    }
}
