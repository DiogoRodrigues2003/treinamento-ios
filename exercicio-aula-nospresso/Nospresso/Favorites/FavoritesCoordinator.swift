import Foundation
import UIKit

class FavoritesCoordinator {
    
}

extension FavoritesCoordinator: FavoritesCoordinatorProtocol {
    
}

extension FavoritesCoordinator {
    
    class func createModule() -> UIViewController {
        let coordinator = FavoritesCoordinator()
        let presenter = FavoritesPresenter(coordinator: coordinator)
        let view = FavoritesViewController(presenter: presenter)
        
        presenter.view = view
        
        return view
    }
    
}

