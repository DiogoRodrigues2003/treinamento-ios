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
    
}

extension ProductCategoriesCoordinator {
    
    class func createModule() -> UIViewController {
        let coordinator = ProductCategoriesCoordinator()
        let presenter = ProductCategoriesPresenter(coordinator: coordinator)
        let view = ProductCategoriesViewController(presenter: presenter)
        
        presenter.view = view
        
        return view
    }
    
}
