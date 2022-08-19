
import Foundation
import UIKit

class HomeCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    
    func openDogBreeds() {
        let dogBreedsViewController = PetBreedsCoordinator.createModule(using: navigationController, type: .dog)
        navigationController?.pushViewController(dogBreedsViewController, animated: true)
    }
    
    func openCatBreeds() {
        let catBreedsViewController = PetBreedsCoordinator.createModule(using: navigationController, type: .cat)
        navigationController?.pushViewController(catBreedsViewController, animated: true)
    }
}

extension HomeCoordinator {
    
    class func createModule(using navigationController: UINavigationController?) -> UIViewController {
        let coordinator = HomeCoordinator(navigationController: navigationController)
        let presenter = HomePresenter(coordinator: coordinator)
        let view = HomeViewController(presenter: presenter)
        
        return view
    }
}
