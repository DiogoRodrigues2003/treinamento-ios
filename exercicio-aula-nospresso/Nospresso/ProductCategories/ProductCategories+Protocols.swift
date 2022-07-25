//
//  ProductCategories+Protocols.swift
//  Nospresso
//
//  Created by Treinamento on 21/07/22.
//

import Foundation

// Presenter -> Coordinator
protocol ProductCategoriesCoordinatorProtocol {
    func openCoffees()
    func openMachines()
    func openAccessories()
}

// Presenter -> ViewController
protocol ProductCategoriesViewControllerProtocol: AnyObject {
    
}

// ViewController -> Presenter
protocol ProductCategoriesPresenterProtocol {
    func coffeesTouched()
    func machinesTouched()
    func accessoriesTouched()
}

// Presenter -> Repository
protocol ProductCategoriesRepositoryInputProtocol {
    func getCoffees()
}

// Repository -> Presenter
protocol ProductCategoriesRepositoryOutputProtocol: AnyObject {
    func getCoffeesSuccess()
}
