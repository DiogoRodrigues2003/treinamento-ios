//
//  ProductCategoriesPresenter.swift
//  Nospresso
//
//  Created by Treinamento on 21/07/22.
//

import Foundation

class ProductCategoriesPresenter {
    
    weak var view: ProductCategoriesViewControllerProtocol?
    let repository: ProductCategoriesRepositoryInputProtocol
    let coordinator: ProductCategoriesCoordinatorProtocol
    
    init(repository: ProductCategoriesRepositoryInputProtocol, coordinator: ProductCategoriesCoordinatorProtocol) {
        self.repository = repository
        self.coordinator = coordinator
    }
    
}

extension ProductCategoriesPresenter: ProductCategoriesPresenterProtocol {
    
    func coffeesTouched() {
        coordinator.openCoffees()
    }
    
    func machinesTouched() {
        coordinator.openMachines()
    }
    
    func accessoriesTouched() {
        coordinator.openAccessories()
    }
    
}
