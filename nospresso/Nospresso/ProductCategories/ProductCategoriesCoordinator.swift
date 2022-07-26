//
//  ProductCategoriesCoordinator.swift
//  Nospresso
//
//  Created by Treinamento on 21/07/22.
//

import Foundation
import UIKit

class ProductCategoriesCoordinator {
    
    weak private(set) internal var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension ProductCategoriesCoordinator: ProductCategoriesCoordinatorProtocol {
    
    func openCoffees() {
        let coffeeViewController = CoffeesCoordinator.createModule(navigationController: navigationController)
        navigationController?.pushViewController(coffeeViewController, animated: true)
    }
    
    func openMachines() {
        // TODO: open machines
    }
    
    func openAccessories() {
        // TODO: open accessories
    }
    
}

extension ProductCategoriesCoordinator {
    
    class func createModule(using navigationController: UINavigationController?) -> UIViewController {
        let coordinator = ProductCategoriesCoordinator(navigationController: navigationController)
        let repository = ProductCategoriesRepository()
        let presenter = ProductCategoriesPresenter(repository: repository, coordinator: coordinator)
        let view = ProductCategoriesViewController(presenter: presenter)
        
        presenter.view = view
        
        return view
    }
    
}
