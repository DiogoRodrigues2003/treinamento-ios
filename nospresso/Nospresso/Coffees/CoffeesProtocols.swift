//
//  CoffeesProtocols.swift
//  Nospresso
//
//  Created by Locação on 26/07/22.
//

import Foundation
import UIKit

// Presenter -> Coordinator
internal protocol CoffeesCoordinatorProtocol {

}

// Presenter -> ViewController
internal protocol CoffeesViewProtocol: AnyObject {
    func reload()
    func showAlert(title: String, message: String)
    func showLoadingIndicator()
    func hideLoadingIndicator()
}

// ViewController -> Presenter
internal protocol CoffeesPresenterProtocol: UITableViewDelegate, UITableViewDataSource {
    func viewDidLoad()
}

// Presenter -> Repository
internal protocol CoffeesRepositoryInputProtocol {
    func getCoffees()
}

// Repository -> Presenter
internal protocol CoffeesRepositoryOutputProtocol: AnyObject {
    func getCoffeesSuccess(with capsules: [Capsule])
    func getCoffeesFailure(with error: APIError)
}
