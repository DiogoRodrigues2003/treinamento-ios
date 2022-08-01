//
//  RepositoriesCoordinator.swift
//  SwiftHub
//
//  Created by Locação on 29/07/22.
//

import Foundation
import UIKit

class RepositoriesCoordinator {
    
    weak private(set) var navigationController: UINavigationController?
    
    internal init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
}

extension RepositoriesCoordinator: RepositoriesCoordinatorProtocol {
    
}

extension RepositoriesCoordinator {
    
    class func createModule(navigationController: UINavigationController?) -> UIViewController {
        let repository = RepositoriesRepository()

        let coordinator = RepositoriesCoordinator(navigationController: navigationController)
        
        let presenter = RepositoriesPresenter(
            repository: repository,
            coordinator: coordinator)
        
        repository.output = presenter

        let viewController = RepositoriesViewController(presenter: presenter)
        presenter.view = viewController
        
        return viewController
    }
    
}
