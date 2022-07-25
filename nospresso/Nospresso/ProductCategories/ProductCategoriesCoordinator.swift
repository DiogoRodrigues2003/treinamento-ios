//
//  ProductCategoriesCoordinator.swift
//  Nospresso
//
//  Created by Treinamento on 21/07/22.
//

import Foundation
import UIKit

class ProductCategoriesCoordinator {
    
}

extension ProductCategoriesCoordinator: ProductCategoriesCoordinatorProtocol {
    
    func openCoffees() {
        // TODO: open coffes
    }
    
    func openMachines() {
        // TODO: open machines
    }
    
    func openAccessories() {
        // TODO: open accessories
    }
    
}

extension ProductCategoriesCoordinator {
    
    class func createModule() -> UIViewController {
        let coordinator = ProductCategoriesCoordinator()
        let repository = ProductCategoriesRepository()
        let presenter = ProductCategoriesPresenter(repository: repository, coordinator: coordinator)
        let view = ProductCategoriesViewController(presenter: presenter)
        
        presenter.view = view
        
        return view
    }
    
}
